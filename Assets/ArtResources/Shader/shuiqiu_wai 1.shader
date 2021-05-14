// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.16 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.16;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9411765,fgcg:0.8665314,fgcb:0.6228374,fgca:1,fgde:1,fgrn:-14,fgrf:245.6,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:33554,y:32650,varname:node_1,prsc:2|emission-90-OUT,alpha-135-A;n:type:ShaderForge.SFN_Fresnel,id:40,x:32886,y:32729,varname:node_40,prsc:2|EXP-41-OUT;n:type:ShaderForge.SFN_Vector1,id:41,x:32684,y:32810,varname:node_41,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:90,x:33350,y:32709,varname:node_90,prsc:2|A-218-OUT,B-135-RGB,C-162-RGB;n:type:ShaderForge.SFN_VertexColor,id:135,x:33234,y:32954,varname:node_135,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:162,x:33118,y:32522,ptovrint:False,ptlb:node_162,ptin:_node_162,varname:node_4024,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-310-UVOUT;n:type:ShaderForge.SFN_Vector1,id:216,x:32908,y:33080,varname:node_216,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:218,x:33088,y:32824,varname:node_218,prsc:2|A-40-OUT,B-216-OUT;n:type:ShaderForge.SFN_Panner,id:310,x:32910,y:32522,varname:node_310,prsc:2,spu:0.1,spv:0.1;proporder:162;pass:END;sub:END;*/

Shader "Shader Forge/shuiqiu_wai" {
    Properties {
        _node_162 ("node_162", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_162; uniform float4 _node_162_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_5111 = _Time + _TimeEditor;
                float2 node_310 = (i.uv0+node_5111.g*float2(0.1,0.1));
                float4 _node_162_var = tex2D(_node_162,TRANSFORM_TEX(node_310, _node_162));
                float3 emissive = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*3.0)*i.vertexColor.rgb*_node_162_var.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,i.vertexColor.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
