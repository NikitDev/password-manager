import sys
import os

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine 
from PySide6.QtCore import QObject, Slot


class Backend(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.r = 0

    @Slot(result=int)
    def val(self):
        self.r = self.r + 10
        return self.r


if __name__ == '__main__':
    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    main = Backend()
    engine.rootContext().setContextProperty('backend', main)

    engine.load(os.path.join(os.path.dirname(__file__), 'qml/main.qml'))

    if not engine.rootObjects():
        sys.exit(-1)
    app.exec()
