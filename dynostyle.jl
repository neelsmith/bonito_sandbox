using Bonito, Observables
Bonito.browser_display()



hiliter = Styles(
    CSS(":hover", "background-color" => "yellow"),
)

underlined = Styles( CSS("text-decoration" => "underline"))
# Use an `Observable` to bridge Julia and Javascript.
styledapp = App() do


    hilited = Observable(false)
    on(println, hilited)
    txtdiv = DOM.div(class = "stylable", style = underlined, "Click me to style!", onclick=js"""(e)=> {
        console.log("Clickie")
    }""")
    #style = map(x-> "color: $(x)", color)
    return DOM.div(
        txtdiv, 
        DOM.h1(style = hiliter, "Hello, Bonito")
        )
    
end

display(styledapp)