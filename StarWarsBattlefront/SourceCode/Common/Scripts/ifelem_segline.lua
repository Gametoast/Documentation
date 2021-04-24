
-- this.LineToAccept = NewSegmentLine(x1,y1,x2,y2,optionallabel,offsetforlabel(required if optionallabel))

function NewSegmentLine(x1,y1,x2,y2,label,labeloffs)

	local temp = { ZPos = 130 } -- = Template --createObj(gIFRoundButtonTemplate , Template)

	-- Text will be at 128 by default, be a bit behind it

	-- Assumed that there is always a horizontal difference (x2>x1 or x1>x2)
	-- There doesn't have to be a vertical difference
	
	-- Type 1: label --------|  (x1<x2)
	--				         |
	-- Type 2: |-------- label  (x2<x1)
	--         |

	-- *
	-- SETUP THE LINES
	-- *	

	local LabelAlpha = 0.8
	local LabelTexture = "gray_rect"

	if(x1<x2) then
		temp.ChunkH = NewIFImage { --uvs_l=0.45, uvs_r=0.55, uvs_t = 0.09, uvs_b=0.1, 
			texture=LabelTexture, 
			alpha = LabelAlpha,
			localpos_l=x1, localpos_t=y1-2, 
			localpos_r=x2, localpos_b=y1+2, inertUVs = 1
		}

		if(y1<y2) then
			temp.ChunkV = NewIFImage { --uvs_l=0.45, uvs_r=0.55, uvs_t = 0.09,uvs_b=0.1, 
				texture=LabelTexture, 
				alpha = LabelAlpha,
				localpos_l=x2-2, localpos_t=y1, 
				localpos_r=x2+2, localpos_b=y2, inertUVs = 1
			}
		elseif (y2<y1) then
			temp.ChunkV = NewIFImage { --uvs_l=0.45, uvs_r=0.55, uvs_t = 0.09,uvs_b=0.1, 
				texture=LabelTexture, 
				alpha = LabelAlpha,
				localpos_l=x2-2, localpos_t=y2, 
				localpos_r=x2+2, localpos_b=y1, inertUVs = 1
			}
		else
			--no vertical component (y1=y2)
		end
	else
		temp.ChunkH = NewIFImage { --uvs_l=0.45, uvs_r=0.55, uvs_t = 0.09, uvs_b=0.1, 
			texture=LabelTexture,
			alpha = LabelAlpha,
			localpos_l=x2, localpos_t=y1-2, 
			localpos_r=x1, localpos_b=y1+2, inertUVs = 1
		}

		if(y1<y2) then
			temp.ChunkV = NewIFImage { --uvs_l=0.45, uvs_r=0.55, uvs_t = 0.09, uvs_b=0.1, 
				texture=LabelTexture,
				alpha = LabelAlpha,
				localpos_l=x2-2, localpos_t=y1, 
				localpos_r=x2+2, localpos_b=y2, inertUVs = 1
			}
		elseif (y2<y1) then
			temp.ChunkV = NewIFImage { --uvs_l=0.45, uvs_r=0.55, uvs_t = 0.09, uvs_b=0.1, 
				texture=LabelTexture,
				alpha = LabelAlpha,
				localpos_l=x2-2, localpos_t=y2, 
				localpos_r=x2+2, localpos_b=y1, inertUVs = 1
			}
		else
			--no vertical component (y1=y2)
		end
	end
	

	-- *
	-- SETUP THE LABEL (if applicable)
	-- *	
	if(label) then

		local XPos
		local TextW

		if(x1 < x2) then
			XPos = x1
			TextW = max(50,(gSafeW * 0.5) + XPos + 10)

			temp.label = NewIFText {
				font = "gamefont_tiny",
				valign = "vcenter",
				halign = "right",
				string = label,
				x= XPos - TextW,
				y= y1 - 30,
				ColorR = 255, ColorG = 255, ColorB = 255,
				textw = TextW + 5,
				texth = 60,
				nocreatebackground = 1,
				startdelay = random() * 0.5,
				leading = -3,
			} -- end of label
		else
			XPos = x1
			TextW = max(50,(gSafeW * 0.5) - XPos + 10)

			temp.label = NewIFText {
				font = "gamefont_tiny",
				valign = "vcenter",
				halign = "left",
				string = label,
				x= XPos,
				y= y1 - 30,
				ColorR = 255, ColorG = 255, ColorB = 255,
				textw = TextW + 5,
				texth = 60,
				nocreatebackground = 1,
				startdelay = random() * 0.5,
				leading = -3,
			} -- end of label
		end
	end
	
	--*
	-- Make a container from this expanded template
	--*
	return NewIFContainer(temp)
end
