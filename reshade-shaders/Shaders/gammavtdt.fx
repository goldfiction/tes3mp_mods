int mgeflags = 0;
// gamma shader
// Compatibility: MGE XE 0, fully working

float exteriorbloom = 2;
float interiorbloom = 3;

float gammaval = 1/2.2;
float4 HDR;
float time;
bool isInterior;
float3 sunpos;
float2 rcpres;


const static float scale =  4.0f;
const static float BloomBoost = 0.07f;
const static float thre = 0.1;
const static float intenb = 1.03;
const static float bsize = 1.0;
const static float bsize2 = 1.0;
const static float dscale = 1.05;
const static float chromaticDispersionRC = 0.02;
const static float chromaticDispersionBY = 0.01;
const static float distortion = 0.0001;
const static float cubicDistortion = 0.0001;
// **HDR VARIABLES** 

static const float3 midlevel = pow(sqrt(1.0 + float3(0.05,0.05,0.05))-float3(0.1,0.1,0.1),2.2);
static const float3 midlevel2 = pow(float3(0.5,0.5,0.5),2.2);
//These are a pain to tweak just right, don't mess with them unless you really want to play around


// **OTHER VARIABLES** 
const static int kernelsize = 7;
const static int kernelsize2 = 4;
const float2 blurPixs2[kernelsize2] = 
{
	{  1.5,  0.5},
	{  0.5, -1.5},
	{ -0.5,  1.5},
	{ -1.5, -0.5},
};
const float1 blurPixs[kernelsize] = 
{
//	{-4.0},
	{-3.0},
	{-2.00},
	{-1.000},
	{ 0.0},
	{ 1.000},
	{ 2.00},
	{ 3.0},
//	{ 4.0}
};
const float1 blurMags[kernelsize] = 
{
//	{0.13},
//	{0.16},
//	{0.18},
//	{0.192},
	{0.05},
	{0.14},
	{0.23},
	{0.32},
	{0.23},
	{0.14},
	{0.05},
//	{0.192},
//	{0.18},
//	{0.16},
//	{0.13}
};



texture lastshader;
sampler s0 = sampler_state { texture = <lastshader>; addressu = clamp; addressv = clamp; magfilter = point; minfilter = point; };
texture lastpass;
sampler s1 = sampler_state { texture = <lastpass>; addressu = clamp; addressv = clamp; magfilter = linear; minfilter = linear; };



float3 Uncharted2Tonemap(float3 x)
{
//float A = 0.15;
float A = 0.25;
float B = 0.50;
float C = 0.10;
float D = 0.20;
float E = 0.02;
float F = 0.30;


return ((x*(A*x+C*B)+D*E)/(x*(A*x+B)+D*F))-E/F;
}

float3 screen(float3 org, float3 bloom)
{
	return 1.0 - (1.0 - org) * (1.0 - bloom);
}

float4 gamma(float2 tex : TEXCOORD) : COLOR0
{
    //float3 c = tex2D(s0, tex).rgb;
	float W = 11.2;
	float3 texColor = tex2D(s0, tex );
	float3 bloomc = tex2D(s1,tex/scale);
	//return float4(pow(bloomc,1/2.2), 1);
	
	texColor = screen(pow(texColor, 2.2), bloomc * BloomBoost);
	//return float4(pow(texColor,1/2.2),1);
	float multip = 1;
	if(isInterior)
	multip = 0.0;
	else
	multip -= 0.5*saturate(1-sunpos.z*1.4);
	multip = saturate(multip + HDR.x - 0.2);
    //texColor *= lerp(55, 2, saturate((HDR.x-0.2)*50));  // Hardcoded Exposure Adjustment
	texColor *= lerp(interiorbloom, exteriorbloom, multip);// Hardcoded Exposure Adjustment
	
   float ExposureBias = 2.0f;
   float3 curr = Uncharted2Tonemap(ExposureBias*texColor);

   float3 whiteScale = 1.0f/Uncharted2Tonemap(W);
   float3 color = curr*whiteScale;
      
   float3 retColor = pow(color,1/2.2);

  /* if(tex.x> 0.9 && tex.y < multip)
   return 1;*/
   
   return float4(retColor,1);
}

float4 ThreshDownScale( float2 Tex : TEXCOORD0 ) : COLOR0
{

	float3 ColorNew = 0;
	if (Tex.x * (scale) > 1.05 || Tex.y*(scale) > 1.05){
	}else{
	ColorNew = pow(tex2D( s0, Tex*(scale) )* intenb, 2.2) - midlevel * thre;
	for (int i=0; i<4; i++){
		ColorNew += pow(tex2D(s0, Tex * (scale) + blurPixs2[i] * bsize * rcpres ) * intenb,2.2) - midlevel * thre;
	}
	}
	return float4(ColorNew/5, 1);
}

float4 ThreshDownScalev( float2 Tex : TEXCOORD0 ) : COLOR0
{

	float3 ColorNew = 0;
	if (Tex.x * (1/scale) > 1.05 || Tex.y*(1/scale) > 1.05){
	}else{
	ColorNew = pow(tex2D( s1, Tex*(1/scale) )* intenb, 2.2) - midlevel * thre;
	for (int i=0; i<4; i++){
		ColorNew += pow(tex2D(s1, Tex * (1/scale) + blurPixs2[i] * bsize * rcpres ) * intenb,2.2) - midlevel * thre;
	}
	}
	return float4(ColorNew/5, 1);
}



float4 MyBloomH( float2 Tex : TEXCOORD0 ) : COLOR0
{
	float3 ColorBloom = 0;
	float3 ColorNew = 0;

	if (Tex.x*(scale) > 1.05 || Tex.y*(scale) > 1.05){
	}else{

	for (int i=0; i<kernelsize; i++){
		ColorBloom = tex2D( s1, Tex + float2(blurPixs[i],0)*rcpres  * bsize2);
		ColorBloom *= float3(blurMags[i],blurMags[i],blurMags[i]);
		ColorNew += ColorBloom;
	}

	}
	return float4((ColorNew), 1);
}

float4 MyBloomV( float2 Tex : TEXCOORD0 ) : COLOR0
{
	float3 ColorBloom = 0;
	float3 ColorNew = 0;

	if (Tex.x*(scale) > 1.05 || Tex.y*(scale) > 1.05){
	}else{

	for (int i=0; i<kernelsize; i++){
		ColorBloom = tex2D( s1, Tex + float2(0,blurPixs[i])*rcpres * bsize2 );
		ColorBloom *= float3(blurMags[i],blurMags[i],blurMags[i]);
		ColorNew += ColorBloom;
	}

	}
	return float4((ColorNew), 1);
}

float4 barrelvig( float2 TexD : TEXCOORD0 ) : COLOR0
{
	
	float ratio = rcpres.x/rcpres.y;
    float scaleFactor = 1.0/dscale;

    //index of refraction of each color channel, causing chromatic dispersion
    float3 eta = float3(1.0+chromaticDispersionRC*0.09,
                        1.0+chromaticDispersionRC*0.06,
                        1.0+chromaticDispersionRC*0.03);
    float3 eta2 = float3(1.0+chromaticDispersionBY*0.06,
                        1.0+chromaticDispersionBY*0.06,
                        1.0+chromaticDispersionBY*0.03);

    float4 inputDistort;
    float2 tex = TexD.xy;
    tex.x = 2.0*(tex.x/1 - 0.5);
    tex.y = 2.0*(tex.y/1 - 0.5);
	
	float2 uv = TexD.xy;
   
    uv *=  1.0 - uv.yx;
	
    float vig = uv.x * uv.y * 15.0; // multiply with sth for intensity
    
    vig = pow(vig, 0.25); // change pow for modifying the extend of the  vignette

	
	
	float2 cent = tex;
	float len = length(tex);
	float gradient = smoothstep(1.39, 0.45, len);
	
	
    // lens distortion coefficient
    float k = distortion;
    // cubic distortion value
    float kcube = cubicDistortion;
    float f = 0.0;

    //APPLY DISTORTION
    float r2 = ratio * ratio * (tex.x) * (tex.x) + (tex.y) * (tex.y);
    //compute the cubic distortion
    f = 1.0 + r2 * (k + kcube * sqrt(r2));

    //Apply CA
    float2 rCoords = (f*eta.r*eta2.r)*scaleFactor*(tex.xy*0.5)+0.5;
    float2 gCoords = (f*eta.g*eta2.g)*scaleFactor*(tex.xy*0.5)+0.5;
    float2 bCoords = (f*eta.b*eta2.b)*scaleFactor*(tex.xy*0.5)+0.5;
    float x = f*scaleFactor*(TexD.x*0.5)+0.5;
    float y = f*scaleFactor*(TexD.y*0.5)+0.5;

    float3 scene  = float3(tex2D(s1,rCoords).r, tex2D(s1,gCoords).g,
                  tex2D(s1,bCoords).b);
				  
	scene *=( 0.2 + 0.8 * pow( 16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y), 0.1 ));
	scene *= 1.0 + 0.015*frac( 17.1*sin( 13.1*floor(12.0*time) ));
	//scene = lerp(scene, scene * vig.xxx, 0.5);
	return float4(scene,1);
}

	

technique T0 < string MGEinterface = "MGE XE 0"; bool requiresHDR = true; >
{
    
	pass {PixelShader = compile ps_3_0 ThreshDownScale();}

	pass {PixelShader = compile ps_3_0 MyBloomH();}
    pass {PixelShader = compile ps_3_0 MyBloomV();}
	pass {PixelShader = compile ps_3_0 MyBloomH();}
    pass {PixelShader = compile ps_3_0 MyBloomV();}
	
	pass { PixelShader = compile ps_3_0 gamma(); }
	pass { PixelShader = compile ps_3_0 barrelvig(); }
	
}
