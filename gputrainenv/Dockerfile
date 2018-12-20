FROM docker.peidan.me/haowenxu/ml-runtime:gpu

RUN apt clean && apt update && apt install -y git vim htop && pip2 install opencv-python setuptools wheel && pip2 install \
pyemd pymongo numpy==1.14.5 scipy sympy pandas tables scikit-learn matplotlib==2.0.2 tqdm \
seaborn pillow imageio PyYAML sqlalchemy pymongo jinja2 scikit-image scipy progressbar2 mock pep8 coverage \
mako Flask GitPython tinydb tinydb-serialization hashfs fs \
tensorflow-gpu==1.12.0rc2 keras