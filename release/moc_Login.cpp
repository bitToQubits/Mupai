/****************************************************************************
** Meta object code from reading C++ file 'Login.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../Login.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Login.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_Login_t {
    uint offsetsAndSizes[26];
    char stringdata0[6];
    char stringdata1[13];
    char stringdata2[1];
    char stringdata3[16];
    char stringdata4[14];
    char stringdata5[20];
    char stringdata6[21];
    char stringdata7[6];
    char stringdata8[10];
    char stringdata9[6];
    char stringdata10[9];
    char stringdata11[12];
    char stringdata12[14];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_Login_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_Login_t qt_meta_stringdata_Login = {
    {
        QT_MOC_LITERAL(0, 5),  // "Login"
        QT_MOC_LITERAL(6, 12),  // "emailChanged"
        QT_MOC_LITERAL(19, 0),  // ""
        QT_MOC_LITERAL(20, 15),  // "passwordChanged"
        QT_MOC_LITERAL(36, 13),  // "statusChanged"
        QT_MOC_LITERAL(50, 19),  // "statusServerChanged"
        QT_MOC_LITERAL(70, 20),  // "loguearse_con_google"
        QT_MOC_LITERAL(91, 5),  // "clear"
        QT_MOC_LITERAL(97, 9),  // "loguearse"
        QT_MOC_LITERAL(107, 5),  // "email"
        QT_MOC_LITERAL(113, 8),  // "password"
        QT_MOC_LITERAL(122, 11),  // "status_form"
        QT_MOC_LITERAL(134, 13)   // "status_server"
    },
    "Login",
    "emailChanged",
    "",
    "passwordChanged",
    "statusChanged",
    "statusServerChanged",
    "loguearse_con_google",
    "clear",
    "loguearse",
    "email",
    "password",
    "status_form",
    "status_server"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_Login[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       4,   63, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   56,    2, 0x06,    5 /* Public */,
       3,    0,   57,    2, 0x06,    6 /* Public */,
       4,    0,   58,    2, 0x06,    7 /* Public */,
       5,    0,   59,    2, 0x06,    8 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       6,    0,   60,    2, 0x0a,    9 /* Public */,
       7,    0,   61,    2, 0x0a,   10 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       8,    0,   62,    2, 0x02,   11 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,

 // properties: name, type, flags
       9, QMetaType::QString, 0x00015103, uint(0), 0,
      10, QMetaType::QString, 0x00015103, uint(1), 0,
      11, QMetaType::Bool, 0x00015001, uint(2), 0,
      12, QMetaType::Bool, 0x00015001, uint(3), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Login::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Login.offsetsAndSizes,
    qt_meta_data_Login,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_Login_t,
        // property 'email'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'password'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'status_form'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'status_server'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Login, std::true_type>,
        // method 'emailChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'passwordChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'statusChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'statusServerChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'loguearse_con_google'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'clear'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'loguearse'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void Login::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Login *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->emailChanged(); break;
        case 1: _t->passwordChanged(); break;
        case 2: _t->statusChanged(); break;
        case 3: _t->statusServerChanged(); break;
        case 4: _t->loguearse_con_google(); break;
        case 5: _t->clear(); break;
        case 6: _t->loguearse(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Login::*)();
            if (_t _q_method = &Login::emailChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Login::*)();
            if (_t _q_method = &Login::passwordChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Login::*)();
            if (_t _q_method = &Login::statusChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Login::*)();
            if (_t _q_method = &Login::statusServerChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
    }else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Login *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->email(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->password(); break;
        case 2: *reinterpret_cast< bool*>(_v) = _t->status_form(); break;
        case 3: *reinterpret_cast< bool*>(_v) = _t->status_server(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Login *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setEmail(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setPassword(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
    (void)_a;
}

const QMetaObject *Login::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Login::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Login.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Login::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 7;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void Login::emailChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Login::passwordChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Login::statusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Login::statusServerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
