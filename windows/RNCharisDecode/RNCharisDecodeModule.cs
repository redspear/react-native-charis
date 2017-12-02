using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Charis.Decode.RNCharisDecode
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNCharisDecodeModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNCharisDecodeModule"/>.
        /// </summary>
        internal RNCharisDecodeModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNCharisDecode";
            }
        }
    }
}
