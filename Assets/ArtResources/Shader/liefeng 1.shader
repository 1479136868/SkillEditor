// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:2,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32530,y:32639|emission-777-OUT,alpha-768-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33669,y:32617,ptlb:node_2,ptin:_node_2,tex:2bf338fda9b701f4aa5bf15c38321bf4,ntxv:0,isnm:False|UVIN-3-UVOUT;n:type:ShaderForge.SFN_Panner,id:3,x:33870,y:32617,spu:0.2,spv:0|UVIN-737-UVOUT,DIST-491-R;n:type:ShaderForge.SFN_Tex2d,id:5,x:33659,y:32804,ptlb:node_2_copy,ptin:_node_2_copy,tex:6273eaf5284d91e43b06c0d5fca624e3,ntxv:0,isnm:False|UVIN-7-UVOUT;n:type:ShaderForge.SFN_Panner,id:7,x:33860,y:32804,spu:-0.1,spv:0|UVIN-755-UVOUT,DIST-62-R;n:type:ShaderForge.SFN_Tex2d,id:62,x:34079,y:32980,ptlb:node_2_copy_copy,ptin:_node_2_copy_copy,tex:6273eaf5284d91e43b06c0d5fca624e3,ntxv:2,isnm:False|UVIN-215-UVOUT;n:type:ShaderForge.SFN_Panner,id:122,x:34701,y:32617,spu:0.15,spv:0;n:type:ShaderForge.SFN_Panner,id:132,x:34292,y:32617,spu:-0.3,spv:0|DIST-649-R;n:type:ShaderForge.SFN_Tex2d,id:213,x:34451,y:32958,ptlb:node_213,ptin:_node_213,tex:fdd4cccc002a3a5469e34c5b99496cef,ntxv:0,isnm:False|UVIN-307-UVOUT;n:type:ShaderForge.SFN_Panner,id:215,x:34256,y:32980,spu:-0.2,spv:0|DIST-213-R;n:type:ShaderForge.SFN_Panner,id:307,x:34660,y:32958,spu:-0.12,spv:0;n:type:ShaderForge.SFN_Tex2d,id:337,x:34492,y:32617,ptlb:node_213_copy,ptin:_node_213_copy,tex:fff872dd5b18f684380f5a365e65a61e,ntxv:0,isnm:False|UVIN-122-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:491,x:34079,y:32617,ptlb:node_2_copy_copy_copy,ptin:_node_2_copy_copy_copy,tex:6273eaf5284d91e43b06c0d5fca624e3,ntxv:2,isnm:False|UVIN-132-UVOUT;n:type:ShaderForge.SFN_Add,id:508,x:33032,y:32661|A-808-OUT,B-819-OUT;n:type:ShaderForge.SFN_Tex2d,id:649,x:34530,y:32425,ptlb:node_2_copy_copy_copy_copy,ptin:_node_2_copy_copy_copy_copy,tex:6273eaf5284d91e43b06c0d5fca624e3,ntxv:2,isnm:False|UVIN-122-UVOUT;n:type:ShaderForge.SFN_Panner,id:737,x:34041,y:32433,spu:-0.1,spv:0;n:type:ShaderForge.SFN_Panner,id:755,x:34079,y:32785,spu:0.12,spv:0;n:type:ShaderForge.SFN_Tex2d,id:766,x:33333,y:33120,ptlb:node_766,ptin:_node_766,tex:ff1511c715f6b3c41b755b07e3b4032e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:767,x:33226,y:32954;n:type:ShaderForge.SFN_Multiply,id:768,x:32894,y:33004|A-767-A,B-799-OUT;n:type:ShaderForge.SFN_Multiply,id:777,x:32794,y:32704|A-508-OUT,B-767-RGB;n:type:ShaderForge.SFN_Tex2d,id:790,x:33319,y:33332,ptlb:node_790,ptin:_node_790,tex:118e99ed79c8d2c4d913c006127ff05a,ntxv:0,isnm:False|UVIN-830-UVOUT;n:type:ShaderForge.SFN_Multiply,id:799,x:33059,y:33156|A-766-R,B-790-R;n:type:ShaderForge.SFN_Power,id:808,x:33295,y:32621|VAL-2-RGB,EXP-809-OUT;n:type:ShaderForge.SFN_Vector1,id:809,x:33479,y:32668,v1:1.4;n:type:ShaderForge.SFN_Power,id:819,x:33295,y:32777|VAL-5-RGB,EXP-821-OUT;n:type:ShaderForge.SFN_Vector1,id:821,x:33479,y:32834,v1:1.4;n:type:ShaderForge.SFN_Rotator,id:830,x:33567,y:33361|UVIN-856-UVOUT,ANG-839-OUT;n:type:ShaderForge.SFN_Vector1,id:839,x:33810,y:33473,v1:1.57;n:type:ShaderForge.SFN_TexCoord,id:856,x:33793,y:33315,uv:0;proporder:2-5-62-213-337-491-649-766-790;pass:END;sub:END;*/

Shader "Shader Forge/liefeng" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_2_copy ("node_2_copy", 2D) = "white" {}
        _node_2_copy_copy ("node_2_copy_copy", 2D) = "black" {}
        _node_213 ("node_213", 2D) = "white" {}
        _node_213_copy ("node_213_copy", 2D) = "white" {}
        _node_2_copy_copy_copy ("node_2_copy_copy_copy", 2D) = "black" {}
        _node_2_copy_copy_copy_copy ("node_2_copy_copy_copy_copy", 2D) = "black" {}
        _node_766 ("node_766", 2D) = "white" {}
        _node_790 ("node_790", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform sampler2D _node_2_copy; uniform float4 _node_2_copy_ST;
            uniform sampler2D _node_2_copy_copy; uniform float4 _node_2_copy_copy_ST;
            uniform sampler2D _node_213; uniform float4 _node_213_ST;
            uniform sampler2D _node_2_copy_copy_copy; uniform float4 _node_2_copy_copy_copy_ST;
            uniform sampler2D _node_2_copy_copy_copy_copy; uniform float4 _node_2_copy_copy_copy_copy_ST;
            uniform sampler2D _node_766; uniform float4 _node_766_ST;
            uniform sampler2D _node_790; uniform float4 _node_790_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_914 = _Time + _TimeEditor;
                float2 node_913 = i.uv0;
                float2 node_122 = (node_913.rg+node_914.g*float2(0.15,0));
                float2 node_132 = (node_913.rg+tex2D(_node_2_copy_copy_copy_copy,TRANSFORM_TEX(node_122, _node_2_copy_copy_copy_copy)).r*float2(-0.3,0));
                float2 node_3 = ((node_913.rg+node_914.g*float2(-0.1,0))+tex2D(_node_2_copy_copy_copy,TRANSFORM_TEX(node_132, _node_2_copy_copy_copy)).r*float2(0.2,0));
                float2 node_307 = (node_913.rg+node_914.g*float2(-0.12,0));
                float2 node_215 = (node_913.rg+tex2D(_node_213,TRANSFORM_TEX(node_307, _node_213)).r*float2(-0.2,0));
                float2 node_7 = ((node_913.rg+node_914.g*float2(0.12,0))+tex2D(_node_2_copy_copy,TRANSFORM_TEX(node_215, _node_2_copy_copy)).r*float2(-0.1,0));
                float4 node_767 = i.vertexColor;
                float3 emissive = ((pow(tex2D(_node_2,TRANSFORM_TEX(node_3, _node_2)).rgb,1.4)+pow(tex2D(_node_2_copy,TRANSFORM_TEX(node_7, _node_2_copy)).rgb,1.4))*node_767.rgb);
                float3 finalColor = emissive;
                float node_830_ang = 1.57;
                float node_830_spd = 1.0;
                float node_830_cos = cos(node_830_spd*node_830_ang);
                float node_830_sin = sin(node_830_spd*node_830_ang);
                float2 node_830_piv = float2(0.5,0.5);
                float2 node_830 = (mul(i.uv0.rg-node_830_piv,float2x2( node_830_cos, -node_830_sin, node_830_sin, node_830_cos))+node_830_piv);
/// Final Color:
                return fixed4(finalColor,(node_767.a*(tex2D(_node_766,TRANSFORM_TEX(node_913.rg, _node_766)).r*tex2D(_node_790,TRANSFORM_TEX(node_830, _node_790)).r)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
