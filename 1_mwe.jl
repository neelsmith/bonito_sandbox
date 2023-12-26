using Bonito
# Set display to start a server and open app in 
# web browser:
Bonito.browser_display()

# Doing that may be comparable/equivalent to this?
#server = Server(app1, "0.0.0.0", 8888)


# A minimal Bonito `App`:
app1 = App(DOM.h1("Hello, Bonito"))
# Start server and display:
display(app1)
