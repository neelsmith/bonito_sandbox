using Bonito
Bonito.browser_display()

"""Create a `Card` with background set to highlight grid structure
"""
function demoCard(content=DOM.div(); style=Styles(), attributes...) 
    Card(content; backgroundcolor=:silver, border_radius="2px", style=Styles(style, "color" => :white),attributes...)
end

function gridded(button, clicks)
    sidebar = demoCard(
        #"SIDEBAR",
        button,
        style = Styles(
            "grid-column" =>  "1",
            "grid-row" =>  "1 / 3",
        )
    )

    header = demoCard(
        #"HEADER",
        Bonito.Label(clicks),
        style = Styles(
            "grid-column" =>  "2",
            "grid-row" =>  "1",
        )
    )

    main = demoCard(
        "MAIN",
        style = Styles(
            "grid-column" =>  "2",
            "grid-row" =>  "2",
        )
    )

    grid = Grid(
        sidebar, header, main,
        columns = "2fr 5fr",
        rows = "50px 1fr"
    )
    return grid
end


# Put some live widgets into the grid.
button = Button("Bump counter")
clicks = Observable(0)
g = gridded(button, clicks)

app3b = App() do session
    on(session, button.value) do bool
        clicks[] = clicks[] + 1
    end
    return(g)
end

display(app3b)

