/*  RED DEATH EFFECT
        Description:    This HLSL shader Reduces every colour chanel linearly to 0 according
                        to an animation coefficient.
        Author:         Benjamin Hume */

struct PS_INPUT
{
    float4 Position   : POSITION;
    float2 Texture    : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 Color   : COLOR0;
};

/*  VARIABLES
        img:                A reference to the 2D image that is being processed
        animCoeff:          An integer value representing how much of the colour channels has been drained.
                            (0 = no effect, 255 = no colour) */

sampler2D img;

int animCoeff;

PS_OUTPUT ps_main(in PS_INPUT In)
{
    PS_OUTPUT pixelOut;

    pixelOut.Color = tex2D(img, In.Texture);
    
    if ((pixelOut.Color.r - (animCoeff / 255.0)) > 0.0) {
        pixelOut.Color.r = pixelOut.Color.r - (animCoeff / 255.0);
    }

    else {
        pixelOut.Color.r = 0.0;
    }



    if ((pixelOut.Color.g - (animCoeff / 255.0)) > 0.0) {
        pixelOut.Color.g = pixelOut.Color.g - (animCoeff / 255.0);
    }

    else {
        pixelOut.Color.g = 0.0;
    }



    if ((pixelOut.Color.b - (animCoeff / 255.0)) > 0.0) {
        pixelOut.Color.b = pixelOut.Color.b - (animCoeff / 255.0);
    }

    else {
        pixelOut.Color.b = 0.0;
    }

    return pixelOut;
}

technique tech_main { pass P0 { PixelShader = compile ps_2_0 ps_main(); } }
