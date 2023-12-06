/****************************************************************************
** Meta object code from reading C++ file 'Chat.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../Chat.h"
#include <QtNetwork/QSslError>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Chat.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.4.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
namespace {
struct qt_meta_stringdata_Chat_t {
    uint offsetsAndSizes[114];
    char stringdata0[5];
    char stringdata1[17];
    char stringdata2[1];
    char stringdata3[21];
    char stringdata4[22];
    char stringdata5[10];
    char stringdata6[10];
    char stringdata7[13];
    char stringdata8[12];
    char stringdata9[20];
    char stringdata10[14];
    char stringdata11[12];
    char stringdata12[13];
    char stringdata13[20];
    char stringdata14[16];
    char stringdata15[10];
    char stringdata16[7];
    char stringdata17[3];
    char stringdata18[11];
    char stringdata19[15];
    char stringdata20[24];
    char stringdata21[21];
    char stringdata22[22];
    char stringdata23[11];
    char stringdata24[6];
    char stringdata25[12];
    char stringdata26[5];
    char stringdata27[5];
    char stringdata28[22];
    char stringdata29[15];
    char stringdata30[6];
    char stringdata31[14];
    char stringdata32[8];
    char stringdata33[9];
    char stringdata34[7];
    char stringdata35[7];
    char stringdata36[9];
    char stringdata37[13];
    char stringdata38[11];
    char stringdata39[7];
    char stringdata40[21];
    char stringdata41[9];
    char stringdata42[16];
    char stringdata43[16];
    char stringdata44[11];
    char stringdata45[14];
    char stringdata46[3];
    char stringdata47[5];
    char stringdata48[6];
    char stringdata49[9];
    char stringdata50[17];
    char stringdata51[15];
    char stringdata52[14];
    char stringdata53[10];
    char stringdata54[14];
    char stringdata55[15];
    char stringdata56[14];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_Chat_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_Chat_t qt_meta_stringdata_Chat = {
    {
        QT_MOC_LITERAL(0, 4),  // "Chat"
        QT_MOC_LITERAL(5, 16),  // "isLoadingChanged"
        QT_MOC_LITERAL(22, 0),  // ""
        QT_MOC_LITERAL(23, 20),  // "isLoading_msgChanged"
        QT_MOC_LITERAL(44, 21),  // "responseImagesChanged"
        QT_MOC_LITERAL(66, 9),  // "AIChanged"
        QT_MOC_LITERAL(76, 9),  // "IDChanged"
        QT_MOC_LITERAL(86, 12),  // "nuevoMensaje"
        QT_MOC_LITERAL(99, 11),  // "nuevaImagen"
        QT_MOC_LITERAL(111, 19),  // "statusServerChanged"
        QT_MOC_LITERAL(131, 13),  // "nombreChanged"
        QT_MOC_LITERAL(145, 11),  // "temaChanged"
        QT_MOC_LITERAL(157, 12),  // "fechaChanged"
        QT_MOC_LITERAL(170, 19),  // "es_plantillaChanged"
        QT_MOC_LITERAL(190, 15),  // "messagesChanged"
        QT_MOC_LITERAL(206, 9),  // "nuevoChat"
        QT_MOC_LITERAL(216, 6),  // "nombre"
        QT_MOC_LITERAL(223, 2),  // "ID"
        QT_MOC_LITERAL(226, 10),  // "editarChat"
        QT_MOC_LITERAL(237, 14),  // "tituloCambiado"
        QT_MOC_LITERAL(252, 23),  // "nombre_plantillaChanged"
        QT_MOC_LITERAL(276, 20),  // "Img_plantillaChanged"
        QT_MOC_LITERAL(297, 21),  // "desc_plantillaChanged"
        QT_MOC_LITERAL(319, 10),  // "nuevoToken"
        QT_MOC_LITERAL(330, 5),  // "token"
        QT_MOC_LITERAL(336, 11),  // "sendMessage"
        QT_MOC_LITERAL(348, 4),  // "text"
        QT_MOC_LITERAL(353, 4),  // "role"
        QT_MOC_LITERAL(358, 21),  // "onPostRequestFinished"
        QT_MOC_LITERAL(380, 14),  // "QNetworkReply*"
        QT_MOC_LITERAL(395, 5),  // "reply"
        QT_MOC_LITERAL(401, 13),  // "createMessage"
        QT_MOC_LITERAL(415, 7),  // "content"
        QT_MOC_LITERAL(423, 8),  // "clipText"
        QT_MOC_LITERAL(432, 6),  // "is_img"
        QT_MOC_LITERAL(439, 6),  // "setear"
        QT_MOC_LITERAL(446, 8),  // "es_nuevo"
        QT_MOC_LITERAL(455, 12),  // "es_plantilla"
        QT_MOC_LITERAL(468, 10),  // "sendPrompt"
        QT_MOC_LITERAL(479, 6),  // "prompt"
        QT_MOC_LITERAL(486, 20),  // "onImgRequestFinished"
        QT_MOC_LITERAL(507, 8),  // "getChats"
        QT_MOC_LITERAL(516, 15),  // "QList<QObject*>"
        QT_MOC_LITERAL(532, 15),  // "obtenerMensajes"
        QT_MOC_LITERAL(548, 10),  // "removeChat"
        QT_MOC_LITERAL(559, 13),  // "guardarTitulo"
        QT_MOC_LITERAL(573, 2),  // "AI"
        QT_MOC_LITERAL(576, 4),  // "tema"
        QT_MOC_LITERAL(581, 5),  // "fecha"
        QT_MOC_LITERAL(587, 8),  // "messages"
        QT_MOC_LITERAL(596, 16),  // "nombre_plantilla"
        QT_MOC_LITERAL(613, 14),  // "desc_plantilla"
        QT_MOC_LITERAL(628, 13),  // "img_plantilla"
        QT_MOC_LITERAL(642, 9),  // "isLoading"
        QT_MOC_LITERAL(652, 13),  // "isLoading_msg"
        QT_MOC_LITERAL(666, 14),  // "responseImages"
        QT_MOC_LITERAL(681, 13)   // "status_server"
    },
    "Chat",
    "isLoadingChanged",
    "",
    "isLoading_msgChanged",
    "responseImagesChanged",
    "AIChanged",
    "IDChanged",
    "nuevoMensaje",
    "nuevaImagen",
    "statusServerChanged",
    "nombreChanged",
    "temaChanged",
    "fechaChanged",
    "es_plantillaChanged",
    "messagesChanged",
    "nuevoChat",
    "nombre",
    "ID",
    "editarChat",
    "tituloCambiado",
    "nombre_plantillaChanged",
    "Img_plantillaChanged",
    "desc_plantillaChanged",
    "nuevoToken",
    "token",
    "sendMessage",
    "text",
    "role",
    "onPostRequestFinished",
    "QNetworkReply*",
    "reply",
    "createMessage",
    "content",
    "clipText",
    "is_img",
    "setear",
    "es_nuevo",
    "es_plantilla",
    "sendPrompt",
    "prompt",
    "onImgRequestFinished",
    "getChats",
    "QList<QObject*>",
    "obtenerMensajes",
    "removeChat",
    "guardarTitulo",
    "AI",
    "tema",
    "fecha",
    "messages",
    "nombre_plantilla",
    "desc_plantilla",
    "img_plantilla",
    "isLoading",
    "isLoading_msg",
    "responseImages",
    "status_server"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_Chat[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
      32,   14, // methods
      14,  284, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      20,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,  206,    2, 0x06,   15 /* Public */,
       3,    0,  207,    2, 0x06,   16 /* Public */,
       4,    0,  208,    2, 0x06,   17 /* Public */,
       5,    0,  209,    2, 0x06,   18 /* Public */,
       6,    0,  210,    2, 0x06,   19 /* Public */,
       7,    0,  211,    2, 0x06,   20 /* Public */,
       8,    0,  212,    2, 0x06,   21 /* Public */,
       9,    0,  213,    2, 0x06,   22 /* Public */,
      10,    0,  214,    2, 0x06,   23 /* Public */,
      11,    0,  215,    2, 0x06,   24 /* Public */,
      12,    0,  216,    2, 0x06,   25 /* Public */,
      13,    0,  217,    2, 0x06,   26 /* Public */,
      14,    0,  218,    2, 0x06,   27 /* Public */,
      15,    2,  219,    2, 0x06,   28 /* Public */,
      18,    2,  224,    2, 0x06,   31 /* Public */,
      19,    0,  229,    2, 0x06,   34 /* Public */,
      20,    0,  230,    2, 0x06,   35 /* Public */,
      21,    0,  231,    2, 0x06,   36 /* Public */,
      22,    0,  232,    2, 0x06,   37 /* Public */,
      23,    1,  233,    2, 0x06,   38 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
      25,    2,  236,    2, 0x0a,   40 /* Public */,
      28,    1,  241,    2, 0x0a,   43 /* Public */,
      31,    2,  244,    2, 0x0a,   45 /* Public */,
      33,    2,  249,    2, 0x0a,   48 /* Public */,
      35,    3,  254,    2, 0x0a,   51 /* Public */,
      38,    1,  261,    2, 0x0a,   55 /* Public */,
      40,    1,  264,    2, 0x0a,   57 /* Public */,
      31,    2,  267,    2, 0x0a,   59 /* Public */,
      41,    0,  272,    2, 0x0a,   62 /* Public */,
      43,    1,  273,    2, 0x0a,   63 /* Public */,
      44,    1,  276,    2, 0x0a,   65 /* Public */,
      45,    2,  279,    2, 0x0a,   67 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::Int,   16,   17,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,   17,   16,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   24,

 // slots: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   26,   27,
    QMetaType::Void, 0x80000000 | 29,   30,
    QMetaType::QJsonObject, QMetaType::QString, QMetaType::QString,   27,   32,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,   26,   34,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool, QMetaType::Bool,   17,   36,   37,
    QMetaType::Void, QMetaType::QString,   39,
    QMetaType::Void, 0x80000000 | 29,   30,
    QMetaType::QJsonObject, QMetaType::QString, QMetaType::QJsonValue,   27,   32,
    0x80000000 | 42,
    QMetaType::Void, QMetaType::Int,   17,
    QMetaType::Void, QMetaType::Int,   17,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,   17,   16,

 // properties: name, type, flags
      46, QMetaType::QString, 0x00015103, uint(3), 0,
      17, QMetaType::Int, 0x00015001, uint(4), 0,
      16, QMetaType::QString, 0x00015103, uint(8), 0,
      47, QMetaType::QString, 0x00015103, uint(9), 0,
      48, QMetaType::QString, 0x00015103, uint(10), 0,
      37, QMetaType::Bool, 0x00015103, uint(11), 0,
      49, QMetaType::QJsonArray, 0x00015001, uint(12), 0,
      50, QMetaType::QString, 0x00015103, uint(16), 0,
      51, QMetaType::QString, 0x00015103, uint(18), 0,
      52, QMetaType::QString, 0x00015103, uint(17), 0,
      53, QMetaType::Bool, 0x00015003, uint(0), 0,
      54, QMetaType::Bool, 0x00015003, uint(1), 0,
      55, QMetaType::QVariantList, 0x00015003, uint(2), 0,
      56, QMetaType::Bool, 0x00015001, uint(7), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Chat::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Chat.offsetsAndSizes,
    qt_meta_data_Chat,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_Chat_t,
        // property 'AI'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'ID'
        QtPrivate::TypeAndForceComplete<qint32, std::true_type>,
        // property 'nombre'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'tema'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'fecha'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'es_plantilla'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'messages'
        QtPrivate::TypeAndForceComplete<QJsonArray, std::true_type>,
        // property 'nombre_plantilla'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'desc_plantilla'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'img_plantilla'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'isLoading'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'isLoading_msg'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'responseImages'
        QtPrivate::TypeAndForceComplete<QVariantList, std::true_type>,
        // property 'status_server'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Chat, std::true_type>,
        // method 'isLoadingChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'isLoading_msgChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'responseImagesChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'AIChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'IDChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'nuevoMensaje'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'nuevaImagen'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'statusServerChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'nombreChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'temaChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fechaChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'es_plantillaChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'messagesChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'nuevoChat'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'editarChat'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'tituloCambiado'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'nombre_plantillaChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'Img_plantillaChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'desc_plantillaChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'nuevoToken'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'sendMessage'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'onPostRequestFinished'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QNetworkReply *, std::false_type>,
        // method 'createMessage'
        QtPrivate::TypeAndForceComplete<QJsonObject, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'clipText'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'setear'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'sendPrompt'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'onImgRequestFinished'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QNetworkReply *, std::false_type>,
        // method 'createMessage'
        QtPrivate::TypeAndForceComplete<QJsonObject, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QJsonValue &, std::false_type>,
        // method 'getChats'
        QtPrivate::TypeAndForceComplete<QList<QObject*>, std::false_type>,
        // method 'obtenerMensajes'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'removeChat'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'guardarTitulo'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>
    >,
    nullptr
} };

void Chat::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Chat *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->isLoadingChanged(); break;
        case 1: _t->isLoading_msgChanged(); break;
        case 2: _t->responseImagesChanged(); break;
        case 3: _t->AIChanged(); break;
        case 4: _t->IDChanged(); break;
        case 5: _t->nuevoMensaje(); break;
        case 6: _t->nuevaImagen(); break;
        case 7: _t->statusServerChanged(); break;
        case 8: _t->nombreChanged(); break;
        case 9: _t->temaChanged(); break;
        case 10: _t->fechaChanged(); break;
        case 11: _t->es_plantillaChanged(); break;
        case 12: _t->messagesChanged(); break;
        case 13: _t->nuevoChat((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<int>>(_a[2]))); break;
        case 14: _t->editarChat((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2]))); break;
        case 15: _t->tituloCambiado(); break;
        case 16: _t->nombre_plantillaChanged(); break;
        case 17: _t->Img_plantillaChanged(); break;
        case 18: _t->desc_plantillaChanged(); break;
        case 19: _t->nuevoToken((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 20: _t->sendMessage((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2]))); break;
        case 21: _t->onPostRequestFinished((*reinterpret_cast< std::add_pointer_t<QNetworkReply*>>(_a[1]))); break;
        case 22: { QJsonObject _r = _t->createMessage((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])));
            if (_a[0]) *reinterpret_cast< QJsonObject*>(_a[0]) = std::move(_r); }  break;
        case 23: _t->clipText((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<bool>>(_a[2]))); break;
        case 24: _t->setear((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<bool>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<bool>>(_a[3]))); break;
        case 25: _t->sendPrompt((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 26: _t->onImgRequestFinished((*reinterpret_cast< std::add_pointer_t<QNetworkReply*>>(_a[1]))); break;
        case 27: { QJsonObject _r = _t->createMessage((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QJsonValue>>(_a[2])));
            if (_a[0]) *reinterpret_cast< QJsonObject*>(_a[0]) = std::move(_r); }  break;
        case 28: { QList<QObject*> _r = _t->getChats();
            if (_a[0]) *reinterpret_cast< QList<QObject*>*>(_a[0]) = std::move(_r); }  break;
        case 29: _t->obtenerMensajes((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 30: _t->removeChat((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 31: _t->guardarTitulo((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 21:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QNetworkReply* >(); break;
            }
            break;
        case 26:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QNetworkReply* >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::isLoadingChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::isLoading_msgChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::responseImagesChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::AIChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::IDChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::nuevoMensaje; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::nuevaImagen; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::statusServerChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::nombreChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::temaChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::fechaChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 10;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::es_plantillaChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 11;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::messagesChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 12;
                return;
            }
        }
        {
            using _t = void (Chat::*)(QString , int );
            if (_t _q_method = &Chat::nuevoChat; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 13;
                return;
            }
        }
        {
            using _t = void (Chat::*)(int , QString );
            if (_t _q_method = &Chat::editarChat; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 14;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::tituloCambiado; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 15;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::nombre_plantillaChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 16;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::Img_plantillaChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 17;
                return;
            }
        }
        {
            using _t = void (Chat::*)();
            if (_t _q_method = &Chat::desc_plantillaChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 18;
                return;
            }
        }
        {
            using _t = void (Chat::*)(QString );
            if (_t _q_method = &Chat::nuevoToken; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 19;
                return;
            }
        }
    }else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Chat *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->AI(); break;
        case 1: *reinterpret_cast< qint32*>(_v) = _t->ID(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->nombre(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->tema(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->fecha(); break;
        case 5: *reinterpret_cast< bool*>(_v) = _t->es_plantilla(); break;
        case 6: *reinterpret_cast< QJsonArray*>(_v) = _t->messages(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->nombre_plantilla(); break;
        case 8: *reinterpret_cast< QString*>(_v) = _t->desc_plantilla(); break;
        case 9: *reinterpret_cast< QString*>(_v) = _t->img_plantilla(); break;
        case 10: *reinterpret_cast< bool*>(_v) = _t->_isLoading; break;
        case 11: *reinterpret_cast< bool*>(_v) = _t->_isLoading_msg; break;
        case 12: *reinterpret_cast< QVariantList*>(_v) = _t->_responseImages; break;
        case 13: *reinterpret_cast< bool*>(_v) = _t->status_server(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Chat *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setAI(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setNombre(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setTema(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setFecha(*reinterpret_cast< QString*>(_v)); break;
        case 5: _t->setEs_plantilla(*reinterpret_cast< bool*>(_v)); break;
        case 7: _t->setNombre_plantilla(*reinterpret_cast< QString*>(_v)); break;
        case 8: _t->setDesc_plantilla(*reinterpret_cast< QString*>(_v)); break;
        case 9: _t->setImg_plantilla(*reinterpret_cast< QString*>(_v)); break;
        case 10:
            if (_t->_isLoading != *reinterpret_cast< bool*>(_v)) {
                _t->_isLoading = *reinterpret_cast< bool*>(_v);
                Q_EMIT _t->isLoadingChanged();
            }
            break;
        case 11:
            if (_t->_isLoading_msg != *reinterpret_cast< bool*>(_v)) {
                _t->_isLoading_msg = *reinterpret_cast< bool*>(_v);
                Q_EMIT _t->isLoading_msgChanged();
            }
            break;
        case 12:
            if (_t->_responseImages != *reinterpret_cast< QVariantList*>(_v)) {
                _t->_responseImages = *reinterpret_cast< QVariantList*>(_v);
                Q_EMIT _t->responseImagesChanged();
            }
            break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *Chat::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Chat::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Chat.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Chat::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 32)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 32;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 32)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 32;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    }
    return _id;
}

// SIGNAL 0
void Chat::isLoadingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Chat::isLoading_msgChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Chat::responseImagesChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Chat::AIChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void Chat::IDChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void Chat::nuevoMensaje()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void Chat::nuevaImagen()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void Chat::statusServerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void Chat::nombreChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void Chat::temaChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void Chat::fechaChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void Chat::es_plantillaChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void Chat::messagesChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void Chat::nuevoChat(QString _t1, int _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 13, _a);
}

// SIGNAL 14
void Chat::editarChat(int _t1, QString _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 14, _a);
}

// SIGNAL 15
void Chat::tituloCambiado()
{
    QMetaObject::activate(this, &staticMetaObject, 15, nullptr);
}

// SIGNAL 16
void Chat::nombre_plantillaChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 16, nullptr);
}

// SIGNAL 17
void Chat::Img_plantillaChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 17, nullptr);
}

// SIGNAL 18
void Chat::desc_plantillaChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 18, nullptr);
}

// SIGNAL 19
void Chat::nuevoToken(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 19, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
