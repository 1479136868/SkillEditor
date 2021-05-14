// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:2,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32311,y:32614|emission-149-OUT,alpha-135-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33269,y:32713,ptlb:node_2,ptin:_node_2,tex:d0b5e7d50728ebd44b37ec140efaaad8,ntxv:0,isnm:False|UVIN-60-OUT;n:type:ShaderForge.SFN_Panner,id:3,x:33596,y:32663,spu:0,spv:2.5|UVIN-18-UVOUT,DIST-30-OUT;n:type:ShaderForge.SFN_Tex2d,id:4,x:32853,y:32994,ptlb:node_4,ptin:_node_4,tex:118e99ed79c8d2c4d913c006127ff05a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5,x:33053,y:32698|A-124-OUT,B-2-RGB;n:type:ShaderForge.SFN_VertexColor,id:6,x:33053,y:32842;n:type:ShaderForge.SFN_TexCoord,id:18,x:33780,y:32652,uv:0;n:type:ShaderForge.SFN_Vector1,id:30,x:33764,y:32816,v1:2;n:type:ShaderForge.SFN_Vector2,id:59,x:33665,y:32885,v1:1,v2:0.3;n:type:ShaderForge.SFN_Multiply,id:60,x:33440,y:32755|A-3-UVOUT,B-59-OUT;n:type:ShaderForge.SFN_Multiply,id:94,x:32865,y:32698|A-5-OUT,B-6-RGB;n:type:ShaderForge.SFN_Vector1,id:124,x:33301,y:32625,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:135,x:32617,y:32884|A-6-A,B-4-R;n:type:ShaderForge.SFN_Multiply,id:149,x:32600,y:32692|A-219-OUT,B-94-OUT,C-6-A;n:type:ShaderForge.SFN_Vector3,id:219,x:32843,y:32572,v1:0.1838235,v2:0.459635,v3:1;proporder:2-4;pass:END;sub:END;*/

Shader "Shader Forge/JuQi_xian" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_4 ("node_4", 2D) = "white" {}
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
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform sampler2D _node_4; uniform float4 _node_4_ST;
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
                float2 node_60 = ((i.uv0.rg+2.0*float2(0,2.5))*float2(1,0.3));
                float4 node_6 = i.vertexColor;
                float3 emissive = (float3(0.1838235,0.459635,1)*((1.5*tex2D(_node_2,TRANSFORM_TEX(node_60, _node_2)).rgb)*node_6.rgb)*node_6.a);
                float3 finalColor = emissive;
                float2 node_226 = i.uv0;
/// Final Color:
                return fixed4(finalColor,(node_6.a*tex2D(_node_4,TRANSFORM_TEX(node_226.rg, _node_4)).r));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
