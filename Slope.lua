layer = createLayer()
cursorlayer = createLayer()
cursorlayer2 = createLayer()
cx, cy = getCursor() 
text = createLayer()
font = loadFont('Play',12)
font2 = loadFont('Play',40)
setNextStrokeWidth(layer,1)--Stroke with
setNextStrokeColor(layer,0, 3.4, 5, 1)--(layer,R,G,B,Transparency)

if pointA and pointB then
    addLine(layer,pointA[1],pointA[2],pointB[1],pointB[2])
end
--resolution marker:
M1 = "0"
M2 = "613"
M3 = "1024"
Desc = "Custom Slope LUA by RyanPryde & Wolfram"
addText(text,font,M1,5,20)
addText(text,font,M2,10,600)
addText(text,font,M3,970,20)
addText(text,font,Desc,380,20)
addText(text,font2,"rx: "..math.floor(cx).."",360,50)
addText(text,font2,"ry: "..math.floor(cy).."",500,50)
-- Cursor setup --
cursorlayer = createLayer()
cursorlayer2 = createLayer()
cx, cy = getCursor() 

function drawCursor ()
if getCursorDown() then
        setDefaultStrokeColor(cursorlayer, Shape_Line, 3, 3, 3, 1)
        setDefaultFillColor(cursorlayer, Shape_Polygon, 3, 3, 3, 1)
    end
    if getCursorReleased() then
        if not pointA then
            pointA = { cx, cy }
        elseif not pointB then
            pointB = { cx, cy }
        else
            pointA = nil
            pointB = nil
        end
    end
    if cx < 0 then return end
        addTriangle(cursorlayer,cx ,cy ,cx + 17.5, cy + 20, cx -2.5, cy + 25)
        setNextStrokeWidth(cursorlayer,3)
        addLine(cursorlayer,cx + 8, cy + 22.5, cx + 12, cy + 35)

        local tooltip = nil
        if not pointA then
            tooltip = 'Click to set slope start'
        elseif not pointB then
            tooltip = 'Click to set slope end'
        else
            tooltip = 'Click to clear slope'
        end

        addText(cursorlayer,font,tooltip,cx+20,cy+30)--Tooltip
        addText(cursorlayer,font,"rx: "..math.floor(cx).."",cx+20,cy+40)--RX TEXT
        addText(cursorlayer,font,"ry: "..math.floor(cy).."",cx+20,cy+50)--RY TEXT
end
drawCursor()
--
requestAnimationFrame (5)
