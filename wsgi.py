import traceback

import cx_Oracle
from flask import Flask, redirect, url_for, request

application = Flask(__name__, static_url_path='')
with open('static/sqltest.html', 'r') as content_file:
    content = content_file.read()


@application.route('/')
def root():
    return content


# http://flask.pocoo.org/snippets/76/
# important that path: because the "/" chars
@application.route('/success/<path:name>')
def success(name):
    out = 'welcome %s' % name
    try:
        connection = cx_Oracle.connect(name)
        cursor = connection.cursor()
        cursor.execute("select * from user_tables")
        out = ' '.join(str(s) for s in cursor.fetchall()) + '\n'
    except Exception:
        out = traceback.format_exc()
    return out


@application.route('/sqltestres', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        user = request.form['nm']
        return redirect(url_for('success', name=user))
    else:
        user = request.args.get('nm')
        return redirect(url_for('success', name=user))


if __name__ == '__main__':
    application.run(debug=True,host='0.0.0.0')
