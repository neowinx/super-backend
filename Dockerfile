FROM    python:3.10

COPY    requirements.txt ./

RUN     pip install --no-cache-dir -r requirements.txt && \
        pip install --no-cache-dir gunicorn

RUN     useradd -m codelab

USER    codelab

WORKDIR /usr/src/app

COPY    . .

CMD     [ "gunicorn", "-b", ":5000", "app:app" ]

EXPOSE  5000
