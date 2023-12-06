/****************************************************************************
** Meta object code from reading C++ file 'User.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../User.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'User.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_User_t {
    uint offsetsAndSizes[32];
    char stringdata0[5];
    char stringdata1[10];
    char stringdata2[1];
    char stringdata3[17];
    char stringdata4[16];
    char stringdata5[13];
    char stringdata6[16];
    char stringdata7[13];
    char stringdata8[14];
    char stringdata9[21];
    char stringdata10[3];
    char stringdata11[10];
    char stringdata12[9];
    char stringdata13[6];
    char stringdata14[6];
    char stringdata15[9];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_User_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_User_t qt_meta_stringdata_User = {
    {
        QT_MOC_LITERAL(0, 4),  // "User"
        QT_MOC_LITERAL(5, 9),  // "IDChanged"
        QT_MOC_LITERAL(15, 0),  // ""
        QT_MOC_LITERAL(16, 16),  // "firstNameChanged"
        QT_MOC_LITERAL(33, 15),  // "lastNameChanged"
        QT_MOC_LITERAL(49, 12),  // "emailChanged"
        QT_MOC_LITERAL(62, 15),  // "passwordChanged"
        QT_MOC_LITERAL(78, 12),  // "obtenerDatos"
        QT_MOC_LITERAL(91, 13),  // "limpiarSesion"
        QT_MOC_LITERAL(105, 20),  // "guardarConfiguracion"
        QT_MOC_LITERAL(126, 2),  // "ID"
        QT_MOC_LITERAL(129, 9),  // "firstName"
        QT_MOC_LITERAL(139, 8),  // "lastName"
        QT_MOC_LITERAL(148, 5),  // "email"
        QT_MOC_LITERAL(154, 5),  // "photo"
        QT_MOC_LITERAL(160, 8)   // "password"
    },
    "User",
    "IDChanged",
    "",
    "firstNameChanged",
    "lastNameChanged",
    "emailChanged",
    "passwordChanged",
    "obtenerDatos",
    "limpiarSesion",
    "guardarConfiguracion",
    "ID",
    "firstName",
    "lastName",
    "email",
    "photo",
    "password"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_User[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       6,   70, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   62,    2, 0x06,    7 /* Public */,
       3,    0,   63,    2, 0x06,    8 /* Public */,
       4,    0,   64,    2, 0x06,    9 /* Public */,
       5,    0,   65,    2, 0x06,   10 /* Public */,
       6,    0,   66,    2, 0x06,   11 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       7,    0,   67,    2, 0x0a,   12 /* Public */,
       8,    0,   68,    2, 0x0a,   13 /* Public */,
       9,    0,   69,    2, 0x0a,   14 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Int,

 // properties: name, type, flags
      10, QMetaType::Int, 0x00015001, uint(0), 0,
      11, QMetaType::QString, 0x00015103, uint(1), 0,
      12, QMetaType::QString, 0x00015003, uint(2), 0,
      13, QMetaType::QString, 0x00015103, uint(3), 0,
      14, QMetaType::QString, 0x00015003, uint(0), 0,
      15, QMetaType::QString, 0x00015103, uint(4), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject User::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_User.offsetsAndSizes,
    qt_meta_data_User,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_User_t,
        // property 'ID'
        QtPrivate::TypeAndForceComplete<qint32, std::true_type>,
        // property 'firstName'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'lastName'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'email'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'photo'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'password'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<User, std::true_type>,
        // method 'IDChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'firstNameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'lastNameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'emailChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'passwordChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'obtenerDatos'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'limpiarSesion'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'guardarConfiguracion'
        QtPrivate::TypeAndForceComplete<int, std::false_type>
    >,
    nullptr
} };

void User::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<User *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->IDChanged(); break;
        case 1: _t->firstNameChanged(); break;
        case 2: _t->lastNameChanged(); break;
        case 3: _t->emailChanged(); break;
        case 4: _t->passwordChanged(); break;
        case 5: _t->obtenerDatos(); break;
        case 6: _t->limpiarSesion(); break;
        case 7: { int _r = _t->guardarConfiguracion();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (User::*)();
            if (_t _q_method = &User::IDChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (User::*)();
            if (_t _q_method = &User::firstNameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (User::*)();
            if (_t _q_method = &User::lastNameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (User::*)();
            if (_t _q_method = &User::emailChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (User::*)();
            if (_t _q_method = &User::passwordChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
    }else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<User *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< qint32*>(_v) = _t->ID(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->firstName(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->lastName(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->email(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->photo(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->password(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<User *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 1: _t->setFirstName(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setlastName(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setEmail(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->photo(*reinterpret_cast< QString*>(_v)); break;
        case 5: _t->setPassword(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *User::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *User::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_User.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int User::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 8;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void User::IDChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void User::firstNameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void User::lastNameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void User::emailChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void User::passwordChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
