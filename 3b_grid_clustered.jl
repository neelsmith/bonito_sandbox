using Bonito
Bonito.browser_display()


"""Create a `Card` with background set to highlight grid structure
"""
function demoCard(content=DOM.div(); style=Styles(), attributes...) 
    Card(content; backgroundcolor=:silver, border_radius="2px", style=Styles(style, "color" => :white),attributes...)
end


"""Create a `Grid` with content in two columns.
"""
function griddeddiv(button, s, clicks)
    Grid(
        demoCard(button),
        demoCard( Bonito.Label(clicks));
   
        height="300px", columns="65% 35%"
    )
end

# Put some live widgets into the grid.
drop = Dropdown(["septuagint", "masoretic", "vulgate"])
button = Button("Bump counter")
clicks = Observable(0)

g = griddeddiv(button, drop, clicks)
typeof(g)

# Build app with live updating of content.
app3 = App() do session
    on(session, button.value) do bool
        clicks[] = clicks[] + 1
    end
    return(g)
end
display(app3)



