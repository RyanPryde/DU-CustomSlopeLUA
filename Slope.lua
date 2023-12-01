layer = createLayer()

text = createLayer()
font = loadFont('Play',12)

-------------------------------------------------------------------
--EDIT Line Points below:
--startpoint: 0/0 is bottom left corner
AX = 0
AY = 613


--endpoint: 1024/0 is top right corner
BX = 1024
BY = 0
-------------------------------------------------------------------

setNextStrokeWidth(layer,1)--Stroke with
setNextStrokeColor(layer,0, 3.4, 5, 1)--(layer,R,G,B,Transparency)
addLine(layer,AX,AY,BX,BY)
--resolution marker:
M1 = "0"
M2 = "613"
M3 = "1024"
Desc = "Custom Slope LUA by RyanPryde | Hadron"
addText(text,font,M1,5,20)
addText(text,font,M2,10,600)
addText(text,font,M3,970,20)
addText(text,font,Desc,380,20)

-- Cursor setup --
cursorlayer = createLayer()
cursorlayer2 = createLayer()
cx, cy = getCursor() 
cursor_image = loadImage("assets.prod.novaquark.com/102348/a6ad4ff3-372f-46f6-8e2c-86aa0c54f3a3.png")
function drawCursor ()
       setNextFillColor(cursorlayer,  0.15, 0.15, 0.15, 1)
       addTriangle(cursorlayer,cx+1,cy+3, cx+4,cy+27, cx+17,cy+22)
    if getCursorDown() then
       setNextFillColor(cursorlayer,1, 0, 2, 1)
       addTriangle(cursorlayer,cx+1,cy+3, cx+3,cy+24, cx+18,cy+19)
       setNextFillColor(cursorlayer, 0.15, 0.15, 0.15, 1)
       addTriangle(cursorlayer,cx+5,cy+12, cx+7,cy+24, cx+13,cy+22)
    end
if cx < 0 then return end
      addImage(cursorlayer2,cursor_image,cx-5.5,cy-2,32,32)
    addText(cursorlayer,font,"rx: "..math.floor(cx).."",cx+20,cy+30)--RX TEXT
    addText(cursorlayer,font,"ry: "..math.floor(cy).."",cx+20,cy+40)--RY TEXT
end
drawCursor()
--
requestAnimationFrame (5)
