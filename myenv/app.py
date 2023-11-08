import dash

from dash import html,dcc,Output,Input
import dash_bootstrap_components as dbc


app = dash.Dash(__name__,external_stylesheets=[dbc.themes.SLATE])


app.layout=dbc.Container([

    dbc.Row([

        dbc.Col([

            html.Div([

                html.H1("My test page"),

                html.H6("Content here")
            ])
        ])
    ])




])

if __name__ == "__main__":
    app.run_server(host="0.0.0.0",debug=True,port=8000)


