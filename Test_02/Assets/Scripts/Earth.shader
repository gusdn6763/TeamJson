﻿Shader "Wallenstein/Earth"
{
	Properties
	{
	   _MainTex1("Albedo (RGB)",2D) = "white" {}
	   _MainTex2("Albedo (RGB)",2D) = "white" {}
	   _TexValue("Texture Value",Range(0,1)) = 0
	}
		SubShader
	   {
		   Tags { "RenderType" = "Opaque" }
		   LOD 200

		   CGPROGRAM
		   // Physically based Standard lighting model, and enable shadows on all light types
		   #pragma surface surf Standard fullforwardshadows

		   // Use shader model 3.0 target, to get nicer looking lighting
		   #pragma target 3.0

		   sampler2D _MainTex1;
		   sampler2D _MainTex2;
		   float _TexValue;

		   struct Input
		   {
			   float2 uv_MainTex1;
			   float2 uv_MainTex2;
		   };

		   void surf(Input IN, inout SurfaceOutputStandard o)
		   {
			   fixed4 c = tex2D(_MainTex1, IN.uv_MainTex1);
			   fixed4 d = tex2D(_MainTex2, IN.uv_MainTex2);
			   o.Albedo = lerp(c.rgb,d.rgb,_TexValue);
			   o.Alpha = lerp(c.a,d.a,_TexValue);
		   }
		   ENDCG
	   }
		   FallBack "Diffuse"
}
