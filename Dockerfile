FROM docker.flcn.io/base/python:2.7

COPY ./requirements.txt /opt/guinea_pig/
RUN pip install -r /opt/guinea_pig/requirements.txt
COPY ./runserver.py /opt/guinea_pig/
COPY ./guinea_pig /opt/guinea_pig/guinea_pig

WORKDIR /opt/guinea_pig

EXPOSE 5000

CMD ["python", "runserver.py"]
