package nslm2.modules.footstones.moduleBases
{
   import morn.core.components.Component;
   import com.mz.core.utils.ArrayUtil;
   import morn.customs.components.ModuleViewBase;
   import morn.customs.expands.MornExpandUtil;
   
   public class ModuleLayerBase extends Component
   {
       
      
      public var moduleList:Vector.<nslm2.modules.footstones.moduleBases.ModuleInfoVo>;
      
      protected var closeTaskArr:Vector.<nslm2.modules.footstones.moduleBases.ShowModuleTask>;
      
      public function ModuleLayerBase()
      {
         moduleList = new Vector.<nslm2.modules.footstones.moduleBases.ModuleInfoVo>();
         closeTaskArr = new Vector.<nslm2.modules.footstones.moduleBases.ShowModuleTask>();
         super();
         this.mouseEnabled = false;
         MornExpandUtil.setLayout(this);
      }
      
      public function closeAll(param1:Array = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = moduleList.length;
         var _loc4_:int = moduleList.length;
         while(true)
         {
            _loc4_--;
            if(_loc4_ <= -1)
            {
               break;
            }
            _loc2_ = moduleList[_loc4_];
            if(param1 == null || param1.indexOf(_loc2_.moduleId) == -1)
            {
               this.closeModuleByInfo(_loc2_,null);
            }
         }
      }
      
      public function switchVisible(param1:String, param2:Boolean, param3:Array = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = moduleList.length;
         var _loc6_:int = moduleList.length;
         while(true)
         {
            _loc6_--;
            if(_loc6_ <= -1)
            {
               break;
            }
            _loc4_ = moduleList[_loc6_];
            if(param3 == null || param3.indexOf(_loc4_.moduleId) == -1)
            {
               if(_loc4_.module)
               {
                  _loc4_.module.setVisibleList(param1,param2);
               }
            }
         }
      }
      
      protected function createModuleInfo(param1:int) : nslm2.modules.footstones.moduleBases.ModuleInfoVo
      {
         var _loc2_:nslm2.modules.footstones.moduleBases.ModuleInfoVo = new nslm2.modules.footstones.moduleBases.ModuleInfoVo();
         _loc2_.moduleId = param1;
         _loc2_.state = 1;
         _loc2_.disposeWhenClose = true;
         return _loc2_;
      }
      
      public function showModule(param1:uint, param2:Object = null, param3:int = 0, param4:* = null) : nslm2.modules.footstones.moduleBases.ModuleInfoVo
      {
         var _loc6_:* = null;
         var _loc5_:nslm2.modules.footstones.moduleBases.ModuleInfoVo = this.getModuleInfo(param1);
         if(_loc5_ == null)
         {
            _loc6_ = ModuleMgr.ins.getConfigVo(param1);
            if(_loc6_ != null)
            {
               _loc5_ = createModuleInfo(param1);
               _loc5_.historyParam = param4;
               _loc5_.parentModuleId = param3;
               _loc5_.configVo = _loc6_;
               _loc5_.param = param2;
               _loc5_.task = new nslm2.modules.footstones.moduleBases.ShowModuleTask(_loc5_);
               _loc5_.task.showHandler = this.showTaskCpl;
               _loc5_.isShow = true;
               moduleList.push(_loc5_);
               _loc5_.task.exec();
            }
            else
            {
               throw new Error("没有找到你所要显示的模块" + param1);
            }
         }
         else if(_loc5_.isShow == false)
         {
            ArrayUtil.removeItem(this.closeTaskArr,_loc5_.task);
            _loc5_.isShow = true;
            _loc5_.parentModuleId = param3;
            _loc5_.historyParam = param4;
            _loc5_.param = param2;
            _loc5_.task.changeModuleState(1);
         }
         return _loc5_;
      }
      
      private function showTaskCpl(param1:nslm2.modules.footstones.moduleBases.ShowModuleTask) : void
      {
         layout();
      }
      
      public function closeModule(param1:uint, param2:Object = null) : void
      {
         var _loc3_:* = null;
         _loc3_ = this.getModuleInfo(param1);
         if(_loc3_)
         {
            this.closeModuleByInfo(_loc3_,param2);
         }
      }
      
      public function getModule(param1:uint) : ModuleViewBase
      {
         var _loc2_:nslm2.modules.footstones.moduleBases.ModuleInfoVo = this.getModuleInfo(param1);
         if(_loc2_)
         {
            return _loc2_.module;
         }
         return null;
      }
      
      public function isShow(param1:uint) : int
      {
         var _loc2_:nslm2.modules.footstones.moduleBases.ModuleInfoVo = this.getModuleInfo(param1);
         if(_loc2_)
         {
            return !!_loc2_.isShow?1:0;
         }
         return 0;
      }
      
      protected function getModuleInfo(param1:uint) : nslm2.modules.footstones.moduleBases.ModuleInfoVo
      {
         return ArrayUtil.findByAttr(this.moduleList,"moduleId",param1) as nslm2.modules.footstones.moduleBases.ModuleInfoVo;
      }
      
      protected function removeModuleInfo(param1:uint) : void
      {
         var _loc2_:int = ArrayUtil.indexByAttr(this.moduleList,"moduleId",param1);
         if(_loc2_ != -1)
         {
            this.moduleList.splice(_loc2_,1);
         }
      }
      
      protected function closeModuleByInfo(param1:nslm2.modules.footstones.moduleBases.ModuleInfoVo, param2:Object) : void
      {
         if(param1.isShow)
         {
            param1.task.closeHandler = this.closeTaskCpl;
            if(param1.disposeWhenClose)
            {
               param1.task.changeModuleState(4);
            }
            else
            {
               param1.task.changeModuleState(3);
            }
            closeTaskArr.push(param1.task);
            param1.isShow = false;
            if(param1.disposeWhenClose)
            {
               this.removeModuleInfo(param1.moduleId);
            }
            layout();
         }
      }
      
      protected function closeTaskCpl(param1:nslm2.modules.footstones.moduleBases.ShowModuleTask) : void
      {
         ArrayUtil.removeItem(this.closeTaskArr,param1);
      }
      
      protected function layout() : void
      {
      }
      
      public function showOrCloseModule(param1:uint, param2:Object = null, param3:int = 0) : void
      {
         var _loc4_:nslm2.modules.footstones.moduleBases.ModuleInfoVo = this.getModuleInfo(param1);
         if(_loc4_ == null || _loc4_.isShow == false)
         {
            this.showModule(param1,param2,param3);
         }
         else
         {
            this.closeModule(param1,param2);
         }
      }
   }
}
