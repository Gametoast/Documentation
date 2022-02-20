
Effect("HDR")
{
	Enable(1)               // whether or not the hdr effect should be enabled
	DownSizeFactor(0.25)    // what fraction of the back buffer to use when bloom (smaller means 
				// better framerate – don’t go below 0.25)
	NumBloomPasses(5)       // the number of blur passes higher numbers means bigger blooms and
        	                // is more costly
	MaxTotalWeight(1.2)     // the amount to over-brighten the glow areas
	GlowThreshold(0.5)      // value at which a pixel is considered to be blooming lower values
				// mean more pixels will be blooming
	GlowFactor(0.5)         // a factor used to dim the overall appearance of the bloom (probably
				// better to use less bloom passes or less total weight)
}



Effect("FogCloud")
{
	Enable(1);
	Texture("fluffy");
	Range(90.0, 120.0);
	Color(168, 172, 180, 128);
	Velocity(5.0, 0.0);
	Rotation(0.1);
	Height(16.0);
	ParticleSize(28.0);
	ParticleDensity(60.0);
}


SunFlare()
{
	Angle(98.000000, -170.000000);
	Color(212, 247, 253);
	Size(1.0);
	FlareOutSize(0.5);
	NumFlareOuts(12);
	InitialFlareOutAlpha(128);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(1.0, 204, 145, 204, 203);
	HaloOutterRing(30.0, 52, 43, 74, 0);
	SpikeColor(20,252,255,128);
	SpikeSize(8.0);
}
