int mgeflags = 1;
// Color Mood Shader v0.2
//    ~shadeMe

// ---------------------------------------
// TWEAKABLE VARIABLES.

// color mood settings
static const float fRatio = 0.4; // 0..1
static const float moodR = 0.35;
static const float moodG = 0.30;
static const float moodB = 0.25;

// END OF TWEAKABLE VARIABLES.
// ---------------------------------------

texture lastshader;
sampler s0 = sampler_state { texture=<lastshader>; addressu = clamp; addressv = clamp; magfilter = point; minfilter = point; };

float4 colorMood(float2 Tex : TEXCOORD0) : COLOR0
{
    float4 colInput = tex2D(s0, Tex);
    float4 colMood = 1.0f;

    colMood.r = moodR;
    colMood.g = moodG;
    colMood.b = moodB;

    float fLum = dot(colInput, 1) / 3;

    colMood = lerp(0, colMood, saturate(fLum * 2.0));
    colMood = lerp(colMood, 1, saturate(fLum - 0.5) * 2.0);

    float4 colOutput = lerp(colInput, colMood, saturate(fLum * fRatio));

    return float4(colOutput.rgb, 1);
}

technique T0 < string MGEinterface="MGE XE 0"; >
{
    pass { PixelShader = compile ps_2_0 colorMood(); }
}
