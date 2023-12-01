layer = createLayer()
cursorlayer = createLayer()
cursorlayer2 = createLayer()
cx, cy = getCursor() 
text = createLayer()
font = loadFont('Play',12)
font2 = loadFont('Play',40)
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
addText(text,font2,"rx: "..math.floor(cx).."",360,50)
addText(text,font2,"rx: "..math.floor(cy).."",500,50)
-- Cursor setup --
cursorlayer = createLayer()
cursorlayer2 = createLayer()
cx, cy = getCursor() 
cursor_image = loadImage("assets.prod.novaquark.com/102348/a6ad4ff3-372f-46f6-8e2c-86aa0c54f3a3.png")
function drawCursor ()
if getCursorDown() then
        setDefaultStrokeColor(cursorlayer, Shape_Line, 3, 3, 3, 1)
        setDefaultFillColor(cursorlayer, Shape_Polygon, 3, 3, 3, 1)
    end
    if cx < 0 then return end
        addTriangle(cursorlayer,cx ,cy ,cx + 17.5, cy + 20, cx -2.5, cy + 25)
        setNextStrokeWidth(cursorlayer,3)
        addLine(cursorlayer,cx + 8, cy + 22.5, cx + 12, cy + 35)
        addText(cursorlayer,font,"rx: "..math.floor(cx).."",cx+20,cy+30)--RX TEXT
        addText(cursorlayer,font,"ry: "..math.floor(cy).."",cx+20,cy+40)--RY TEXT
end
drawCursor()
--
requestAnimationFrame (5)
