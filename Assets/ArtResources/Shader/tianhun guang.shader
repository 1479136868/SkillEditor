// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32365,y:32677|emission-8-OUT,alpha-5-A;n:type:ShaderForge.SFN_Fresnel,id:2,x:33286,y:32675|EXP-9-OUT;n:type:ShaderForge.SFN_Multiply,id:3,x:33010,y:32740|A-2-OUT,B-4-OUT;n:type:ShaderForge.SFN_Vector3,id:4,x:33380,y:32836,v1:0,v2:0.3793104,v3:1;n:type:ShaderForge.SFN_VertexColor,id:5,x:32970,y:32974;n:type:ShaderForge.SFN_Vector1,id:6,x:33041,y:32628,v1:5;n:type:ShaderForge.SFN_Multiply,id:7,x:32829,y:32698|A-6-OUT,B-3-OUT;n:type:ShaderForge.SFN_Multiply,id:8,x:32642,y:32772|A-7-OUT,B-5-RGB;n:type:ShaderForge.SFN_Vector1,id:9,x:33547,y:32690,v1:1.8;pass:END;sub:END;*/

Shader "Shader Forge/Juese_fresnel" {
    Properties {
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_5 = i.vertexColor;
                float3 emissive = ((5.0*(pow(1.0-max(0,dot(normalDirection, viewDirection)),1.8)*float3(0,0.3793104,1)))*node_5.rgb);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,node_5.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
