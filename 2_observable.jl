using Bonito, Observables
# Set display to start a server and open app in 
# web browser:
Bonito.browser_display()

# Use an `Observable` to bridge Julia dn JS:
app2 = App() do
    color = Observable("red")
    on(println, color)
    button = DOM.div("click me", onclick=js"""(e)=> {
        const color = '#' + ((1<<24)*Math.random() | 0).toString(16)
        console.log(color)
        $(color).notify(color)
    }""")
    style = map(x-> "color: $(x)", color)
    return DOM.div(
        button, DOM.h1("Hello, Bonito", style=style)
    )
end

display(app2)