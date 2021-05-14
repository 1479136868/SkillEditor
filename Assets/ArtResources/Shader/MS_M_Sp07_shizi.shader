// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:2,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32311,y:32614|emission-5-OUT,alpha-6-A;n:type:ShaderForge.SFN_Tex2d,id:2,x:33700,y:32580,ptlb:node_2,ptin:_node_2,tex:e44ac49b96c71f54e99853399d978ea8,ntxv:0,isnm:False|UVIN-60-OUT;n:type:ShaderForge.SFN_Panner,id:3,x:34069,y:32479,spu:0,spv:1|UVIN-18-UVOUT,DIST-86-OUT;n:type:ShaderForge.SFN_Tex2d,id:4,x:33049,y:32819,ptlb:node_4,ptin:_node_4,tex:118e99ed79c8d2c4d913c006127ff05a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5,x:32674,y:32714|A-71-OUT,B-4-RGB,C-6-RGB;n:type:ShaderForge.SFN_VertexColor,id:6,x:32876,y:32862;n:type:ShaderForge.SFN_TexCoord,id:18,x:34387,y:32466,uv:0;n:type:ShaderForge.SFN_Vector2,id:59,x:34069,y:32639,v1:1,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:60,x:33895,y:32557|A-3-UVOUT,B-59-OUT;n:type:ShaderForge.SFN_Multiply,id:71,x:33049,y:32653|A-72-OUT,B-154-OUT;n:type:ShaderForge.SFN_Vector3,id:72,x:33212,y:32560,v1:1,v2:0.7923935,v3:0.3455882;n:type:ShaderForge.SFN_Vector1,id:86,x:34274,y:32626,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:106,x:33926,y:32776,ptlb:node_106,ptin:_node_106,tex:f4111f186eb330e41b174fa91b87ca5d,ntxv:0,isnm:False|UVIN-116-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:107,x:33908,y:32971,ptlb:node_107,ptin:_node_107,tex:b3ea4d7445f36b54f86b74c7e5adf44c,ntxv:0,isnm:False|UVIN-118-UVOUT;n:type:ShaderForge.SFN_Panner,id:116,x:34100,y:32776,spu:0.1,spv:-0.2;n:type:ShaderForge.SFN_Panner,id:118,x:34100,y:32990,spu:-0.15,spv:0.08;n:type:ShaderForge.SFN_Multiply,id:119,x:33700,y:32823|A-106-RGB,B-107-R,C-201-OUT;n:type:ShaderForge.SFN_Multiply,id:154,x:33225,y:32706|A-242-OUT,B-119-OUT,C-201-OUT;n:type:ShaderForge.SFN_Vector1,id:201,x:33729,y:33008,v1:2;n:type:ShaderForge.SFN_Multiply,id:242,x:33468,y:32612|A-273-OUT,B-2-RGB;n:type:ShaderForge.SFN_Vector1,id:273,x:33635,y:32507,v1:1.5;proporder:2-4-106-107;pass:END;sub:END;*/

Shader "Shader Forge/JuQi_xian" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_4 ("node_4", 2D) = "white" {}
        _node_106 ("node_106", 2D) = "white" {}
        _node_107 ("node_107", 2D) = "white" {}
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
            uniform sampler2D _node_4; uniform float4 _node_4_ST;
            uniform sampler2D _node_106; uniform float4 _node_106_ST;
            uniform sampler2D _node_107; uniform float4 _node_107_ST;
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
                float2 node_60 = ((i.uv0.rg+0.5*float2(0,1))*float2(1,0.5));
                float4 node_303 = _Time + _TimeEditor;
                float2 node_302 = i.uv0;
                float2 node_116 = (node_302.rg+node_303.g*float2(0.1,-0.2));
                float2 node_118 = (node_302.rg+node_303.g*float2(-0.15,0.08));
                float node_201 = 2.0;
                float4 node_6 = i.vertexColor;
                float3 emissive = ((float3(1,0.7923935,0.3455882)*((1.5*tex2D(_node_2,TRANSFORM_TEX(node_60, _node_2)).rgb)*(tex2D(_node_106,TRANSFORM_TEX(node_116, _node_106)).rgb*tex2D(_node_107,TRANSFORM_TEX(node_118, _node_107)).r*node_201)*node_201))*tex2D(_node_4,TRANSFORM_TEX(node_302.rg, _node_4)).rgb*node_6.rgb);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,node_6.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
