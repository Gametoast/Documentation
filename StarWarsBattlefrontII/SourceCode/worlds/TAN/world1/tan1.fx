Effect("hdr")
{
	Enable(1)
	DownSizeFactor(0.25)
	NumBloomPasses(4)
	MaxTotalWeight(1.0)
	GlowThreshold(0.9)
	GlowFactor(1.0)

	PS2()
	{
		MaxTotalWeight(1.1)
	}
	
}
