// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31677,y:32493|emission-135-OUT,alpha-122-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33264,y:32592,ptlb:node_2,ptin:_node_2,tex:f6914acd42350f049b62100b561ccfa6,ntxv:0,isnm:False|UVIN-4-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3,x:33264,y:32791,ptlb:node_3,ptin:_node_3,tex:fdd4cccc002a3a5469e34c5b99496cef,ntxv:0,isnm:False|UVIN-5-UVOUT;n:type:ShaderForge.SFN_Panner,id:4,x:33425,y:32592,spu:0.06,spv:0.08;n:type:ShaderForge.SFN_Panner,id:5,x:33450,y:32791,spu:0.05,spv:0.1;n:type:ShaderForge.SFN_Multiply,id:6,x:33007,y:32713|A-2-R,B-3-R;n:type:ShaderForge.SFN_Panner,id:7,x:32956,y:32501,spu:0.01,spv:-0.02;n:type:ShaderForge.SFN_Add,id:8,x:32755,y:32630|A-7-UVOUT,B-6-OUT;n:type:ShaderForge.SFN_Tex2d,id:9,x:32512,y:32613,ptlb:node_9,ptin:_node_9,tex:11879cf931eb7e14a861c4c13a6b62c6,ntxv:0,isnm:False|UVIN-8-OUT;n:type:ShaderForge.SFN_VertexColor,id:46,x:32478,y:32790;n:type:ShaderForge.SFN_Multiply,id:47,x:32202,y:32535|A-48-OUT,B-9-B,C-46-RGB;n:type:ShaderForge.SFN_Vector1,id:48,x:32553,y:32488,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:122,x:32183,y:32770|A-9-B,B-46-A;n:type:ShaderForge.SFN_Multiply,id:135,x:31977,y:32523|A-136-OUT,B-47-OUT;n:type:ShaderForge.SFN_Vector3,id:136,x:32217,y:32385,v1:0.4558824,v2:0.6397564,v3:1;proporder:2-3-9;pass:END;sub:END;*/

Shader "Shader Forge/Bing" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_3 ("node_3", 2D) = "white" {}
        _node_9 ("node_9", 2D) = "white" {}
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _node_3; uniform float4 _node_3_ST;
            uniform sampler2D _node_9; uniform float4 _node_9_ST;
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
                float4 node_164 = _Time + _TimeEditor;
                float2 node_163 = i.uv0;
                float2 node_4 = (node_163.rg+node_164.g*float2(0.06,0.08));
                float2 node_5 = (node_163.rg+node_164.g*float2(0.05,0.1));
                float2 node_8 = ((node_163.rg+node_164.g*float2(0.01,-0.02))+(tex2D(_node_2,TRANSFORM_TEX(node_4, _node_2)).r*tex2D(_node_3,TRANSFORM_TEX(node_5, _node_3)).r));
                float4 node_9 = tex2D(_node_9,TRANSFORM_TEX(node_8, _node_9));
                float4 node_46 = i.vertexColor;
                float3 emissive = (float3(0.4558824,0.6397564,1)*(1.5*node_9.b*node_46.rgb));
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,(node_9.b*node_46.a));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
