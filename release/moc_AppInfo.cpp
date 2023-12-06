/****************************************************************************
** Meta object code from reading C++ file 'AppInfo.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../app/src/AppInfo.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'AppInfo.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_AppInfo_t {
    uint offsetsAndSizes[18];
    char stringdata0[8];
    char stringdata1[15];
    char stringdata2[1];
    char stringdata3[12];
    char stringdata4[13];
    char stringdata5[13];
    char stringdata6[8];
    char stringdata7[5];
    char stringdata8[6];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_AppInfo_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_AppInfo_t qt_meta_stringdata_AppInfo = {
    {
        QT_MOC_LITERAL(0, 7),  // "AppInfo"
        QT_MOC_LITERAL(8, 14),  // "versionChanged"
        QT_MOC_LITERAL(23, 0),  // ""
        QT_MOC_LITERAL(24, 11),  // "langChanged"
        QT_MOC_LITERAL(36, 12),  // "activeWindow"
        QT_MOC_LITERAL(49, 12),  // "reiniciarApp"
        QT_MOC_LITERAL(62, 7),  // "version"
        QT_MOC_LITERAL(70, 4),  // "lang"
        QT_MOC_LITERAL(75, 5)   // "Lang*"
    },
    "AppInfo",
    "versionChanged",
    "",
    "langChanged",
    "activeWindow",
    "reiniciarApp",
    "version",
    "lang",
    "Lang*"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_AppInfo[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       2,   42, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   38,    2, 0x06,    3 /* Public */,
       3,    0,   39,    2, 0x06,    4 /* Public */,
       4,    0,   40,    2, 0x06,    5 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       5,    0,   41,    2, 0x02,    6 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,

 // properties: name, type, flags
       6, QMetaType::QString, 0x00015003, uint(0), 0,
       7, 0x80000000 | 8, 0x0001500b, uint(1), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject AppInfo::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_AppInfo.offsetsAndSizes,
    qt_meta_data_AppInfo,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_AppInfo_t,
        // property 'version'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'lang'
        QtPrivate::TypeAndForceComplete<Lang*, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<AppInfo, std::true_type>,
        // method 'versionChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'langChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'activeWindow'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'reiniciarApp'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void AppInfo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AppInfo *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->versionChanged(); break;
        case 1: _t->langChanged(); break;
        case 2: _t->activeWindow(); break;
        case 3: _t->reiniciarApp(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (AppInfo::*)();
            if (_t _q_method = &AppInfo::versionChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (AppInfo::*)();
            if (_t _q_method = &AppInfo::langChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (AppInfo::*)();
            if (_t _q_method = &AppInfo::activeWindow; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Lang* >(); break;
        }
    }
else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<AppInfo *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->_version; break;
        case 1: *reinterpret_cast< Lang**>(_v) = _t->_lang; break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<AppInfo *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (_t->_version != *reinterpret_cast< QString*>(_v)) {
                _t->_version = *reinterpret_cast< QString*>(_v);
                Q_EMIT _t->versionChanged();
            }
            break;
        case 1:
            if (_t->_lang != *reinterpret_cast< Lang**>(_v)) {
                _t->_lang = *reinterpret_cast< Lang**>(_v);
                Q_EMIT _t->langChanged();
            }
            break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *AppInfo::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AppInfo::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AppInfo.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AppInfo::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 4;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void AppInfo::versionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void AppInfo::langChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void AppInfo::activeWindow()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
