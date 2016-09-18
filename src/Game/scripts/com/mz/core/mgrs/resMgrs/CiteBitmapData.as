package com.mz.core.mgrs.resMgrs
{
   import flash.display.BitmapData;
   import com.mz.core.interFace.ITimesCited;
   import com.mz.core.interFace.IUniqueId;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.utils.ArrayUtil;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   
   public class CiteBitmapData extends BitmapData implements ITimesCited
   {
       
      
      public var name:String;
      
      private var citedLib:Array;
      
      public function CiteBitmapData(param1:BitmapData, param2:String)
      {
         citedLib = [];
         this.name = param2;
         super(param1.width,param1.height,param1.transparent,0);
         this.copyPixels(param1,new Rectangle(0,0,width,height),new Point(0,0));
      }
      
      public function addCited(param1:IUniqueId) : void
      {
         var _loc2_:* = !!EnvConfig.ins.useCiteTarget?param1:param1.uniqueId;
         if(citedLib.indexOf(_loc2_) == -1)
         {
            citedLib.push(_loc2_);
         }
      }
      
      public function countCited() : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         if(EnvConfig.ins.autoRemoveCite)
         {
            _loc2_ = citedLib.length;
            _loc3_ = _loc2_ - 1;
            while(_loc3_ >= 0)
            {
               _loc1_ = citedLib[_loc3_] as IDispose;
               if(_loc1_ && _loc1_.hasOwnProperty("isDisposed") && _loc1_["isDisposed"] == true)
               {
                  citedLib.splice(_loc3_,1);
               }
               _loc3_--;
            }
         }
         return citedLib.length;
      }
      
      public function removeCited(param1:IUniqueId) : void
      {
         var _loc2_:* = !!EnvConfig.ins.useCiteTarget?param1:param1.uniqueId;
         ArrayUtil.removeItem(this.citedLib,_loc2_);
      }
      
      override public function dispose() : void
      {
         citedLib = null;
         super.dispose();
      }
   }
}
