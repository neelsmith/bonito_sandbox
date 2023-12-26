using Bonito
Bonito.browser_display()

function griddeddiv()

    return nothing
end

g = griddeddiv()
typeof(g)
app3 = App() do session
    s = Bonito.StylableSlider(0:10;)
    d = Dropdown(["a", "b", "c"])
    ni = NumberInput(10.0)
    ti = Bonito.TextField("helo")
    button = Button("click")
    clicks = Observable(0)
    on(session, button.value) do bool
        clicks[] = clicks[] + 1
    end
    Card(Grid(
        button, Bonito.Label(clicks),
        s, Bonito.Label(s.value),
        d, Bonito.Label(d.value),
        ni, Bonito.Label(ni.value),
        ti, Bonito.Label(ti.value);
        
        columns="1fr min-content",
        justify_content="begin",
        align_items="center",
    ); width="300px",)


    #return 
end
display(app3)
