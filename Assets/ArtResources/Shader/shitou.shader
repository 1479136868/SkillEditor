// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31809,y:32432|emission-17-OUT,alpha-27-A;n:type:ShaderForge.SFN_Tex2d,id:2,x:33642,y:32596,ptlb:node_2,ptin:_node_2,tex:b3ea4d7445f36b54f86b74c7e5adf44c,ntxv:0,isnm:False|UVIN-4-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3,x:33642,y:32813,ptlb:node_3,ptin:_node_3,tex:72466a98ea44f704081938115b64cd04,ntxv:0,isnm:False|UVIN-5-UVOUT;n:type:ShaderForge.SFN_Panner,id:4,x:33841,y:32596,spu:0,spv:0.1;n:type:ShaderForge.SFN_Panner,id:5,x:33851,y:32820,spu:0,spv:0.2;n:type:ShaderForge.SFN_Multiply,id:6,x:33517,y:32423|A-2-R,B-3-R;n:type:ShaderForge.SFN_Multiply,id:8,x:33122,y:32365|A-6-OUT,B-9-OUT;n:type:ShaderForge.SFN_Vector1,id:9,x:33418,y:32582,v1:3;n:type:ShaderForge.SFN_Multiply,id:10,x:32941,y:32502|A-8-OUT,B-6-OUT;n:type:ShaderForge.SFN_Multiply,id:12,x:32530,y:32629|A-10-OUT,B-13-OUT;n:type:ShaderForge.SFN_Vector3,id:13,x:32818,y:32798,v1:0.8529412,v2:0.3631304,v3:0;n:type:ShaderForge.SFN_Tex2d,id:14,x:32826,y:32256,ptlb:node_14,ptin:_node_14,tex:f591275b95a2e8846910c8a18155def8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Power,id:15,x:32530,y:32397|VAL-14-RGB,EXP-16-OUT;n:type:ShaderForge.SFN_Vector1,id:16,x:32736,y:32431,v1:1.5;n:type:ShaderForge.SFN_Add,id:17,x:32194,y:32469|A-15-OUT,B-12-OUT;n:type:ShaderForge.SFN_VertexColor,id:27,x:32221,y:32657;proporder:2-3-14;pass:END;sub:END;*/

Shader "Shader Forge/shitou" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_3 ("node_3", 2D) = "white" {}
        _node_14 ("node_14", 2D) = "white" {}
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
            uniform sampler2D _node_14; uniform float4 _node_14_ST;
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
                float2 node_59 = i.uv0;
                float4 node_60 = _Time + _TimeEditor;
                float2 node_4 = (node_59.rg+node_60.g*float2(0,0.1));
                float2 node_5 = (node_59.rg+node_60.g*float2(0,0.2));
                float node_6 = (tex2D(_node_2,TRANSFORM_TEX(node_4, _node_2)).r*tex2D(_node_3,TRANSFORM_TEX(node_5, _node_3)).r);
                float3 emissive = (pow(tex2D(_node_14,TRANSFORM_TEX(node_59.rg, _node_14)).rgb,1.5)+(((node_6*3.0)*node_6)*float3(0.8529412,0.3631304,0)));
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,i.vertexColor.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
