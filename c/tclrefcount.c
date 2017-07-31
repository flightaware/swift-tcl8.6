/*
 * Swift can't find Tcl_IncrRefCount and Tcl_DecrRefCount
 * because they are macros so here we implement them as
 * swift-callable functions
 *
 * Created by Karl Lehenbauer on 4/6/16.
 * Copyright © 2016,2017 FlightAware. All rights reserved.
 */

#include "tclrefcount.h"

/*
 * DecrRefCount - decrement a Tcl object's reference count,
 * freeing it if the count falls below 1
 */
void DecrRefCount(Tcl_Obj *obj) {
    if (--(obj)->refCount <= 0) {
        TclFreeObj(obj);
    }
}

/*
 * IncrRefCount - increment a Tcl object's reference count
 */
void IncrRefCount(Tcl_Obj *obj) {
    ++obj->refCount;
}
