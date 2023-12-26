using Bonito, Observables
# Set display to start a server and open app in 
# web browser:
Bonito.browser_display()

 
# Use an `Observable` to bridge Julia and Javascript.
app2 = App() do
    color = Observable("black")
    on(println, color)
    button = DOM.div("click me", onclick=js"""(e)=> {
        const colorlist = ['black', 'red', 'green', 'blue']       ;
        let idx = Math.floor(Math.random() * 4);
        const color = colorlist[idx]
        console.log(color)
        $(color).notify(color)
    }""")
    style = map(x-> "color: $(x)", color)
    return DOM.div(
        button, DOM.h1("Hello, Bonito", style=style)
    )
end

display(app2)