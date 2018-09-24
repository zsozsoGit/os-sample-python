from flask import Flask, redirect, url_for, request

application = Flask(__name__, static_url_path='')
with open('static/sqltest.html', 'r') as content_file:
    content = content_file.read()


@application.route('/')
def root():
    return content



@application.route('/success/<name>')
def success(name):
    return 'welcome %s' % name


@application.route('/sqltestres', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        user = request.form['nm']
        return redirect(url_for('success', name=user))
    else:
        user = request.args.get('nm')
        return redirect(url_for('success', name=user))


if __name__ == '__main__':
    application.run(debug=True)
