package nslm2.modules.footstones.moduleBases
{
   import com.mz.core.mgrs.resMgrs.ResVo;
   import morn.core.utils.PathUtil;
   import global.GlobalManager;
   
   public class ModuleConfigVo
   {
      
      public static const DEFULT_COVER_ALPHA:Number = 0.2;
      
      public static const USE_COVER_AUTO:int = 0;
      
      public static const USE_COVER_FORCE_USE:int = 1;
      
      public static const USE_COVER_FORCE_NO:int = 4;
       
      
      public var moduleId:int;
      
      public var layerKind:int;
      
      public var moduleCls:Class;
      
      public var loadingArr:Array;
      
      public var disposeWhenCloseProxy:int = 0;
      
      public var useCoverKind:int;
      
      public var coverAlpha:Number = NaN;
      
      public var forceShowLoadingType:int;
      
      public var noHideLoading:Boolean;
      
      public var loadingAutoAdd:Boolean = true;
      
      public function ModuleConfigVo(param1:int, param2:int, param3:Class, param4:Array = null)
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         super();
         this.moduleId = param1;
         this.layerKind = param2;
         this.moduleCls = param3;
         this.loadingArr = param4;
         var _loc6_:Array = [];
         if(this.loadingArr != null && this.loadingArr.length != 0)
         {
            _loc7_ = 0;
            while(_loc7_ < this.loadingArr.length)
            {
               if(this.loadingArr[_loc7_] is ResVo)
               {
                  if(ResVo(this.loadingArr[_loc7_]).type == 32 || ResVo(this.loadingArr[_loc7_]).type == 33)
                  {
                     _loc5_ = PathUtil.parseNameWithoutSuffix(ResVo(this.loadingArr[_loc7_]).url);
                     if(GlobalManager.hasGlobalSwfDic.containsKey(_loc5_))
                     {
                        _loc6_.push(new ResVo(ResVo(this.loadingArr[_loc7_]).url.replace(_loc5_,_loc5_ + "_" + App.language)));
                     }
                  }
               }
               _loc7_++;
            }
            this.loadingArr = this.loadingArr.concat(_loc6_);
         }
      }
      
      public function set_forceShowLoadingType(param1:int) : ModuleConfigVo
      {
         this.forceShowLoadingType = param1;
         return this;
      }
      
      public function set_noHideLoading(param1:Boolean) : ModuleConfigVo
      {
         this.noHideLoading = param1;
         return this;
      }
      
      public function set_loadingAutoAdd(param1:Boolean) : ModuleConfigVo
      {
         this.loadingAutoAdd = param1;
         return this;
      }
   }
}
