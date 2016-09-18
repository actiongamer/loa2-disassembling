package nslm2.modules.footstones.newerFunctionOpen
{
   import game.ui.mainToolBar.NewerFunctionOpenMsgModuleUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionOpenTipsVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.globals.GlobalRef;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.greensock.TweenLite;
   import morn.customs.expands.MornExpandUtil;
   
   public class NewerFunctionOpen extends NewerFunctionOpenMsgModuleUI
   {
      
      public static var userClose:Boolean = false;
       
      
      public function NewerFunctionOpen()
      {
         super();
         this.bottom = 80;
         this.centerX = 0;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["PLAYER_LEVEL_UP"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc7_:* = param1;
         if("PLAYER_LEVEL_UP" === _loc7_)
         {
            _loc3_ = StcMgr.ins.getFunctionOpenTipsTable();
            _loc7_ = 0;
            var _loc6_:* = _loc3_.array;
            for each(var _loc5_ in _loc3_.array)
            {
               if(_loc5_.tipsOpenLv <= PlayerModel.ins.level)
               {
                  if(_loc4_ == null)
                  {
                     _loc4_ = _loc5_;
                  }
                  else if(_loc4_.tipsOpenLv < _loc5_.tipsOpenLv)
                  {
                     _loc4_ = _loc5_;
                  }
               }
            }
            txtOpenLv.text = LocaleMgr.ins.getStr(999000743,[_loc4_.functionOpenLv.toString()]);
            txtFunName.text = LocaleMgr.ins.getStr(_loc4_.name);
            txtFunDesc.text = LocaleMgr.ins.getStr(_loc4_.describe);
            img_new.url = "modules/funcOpen/" + _loc4_.icon + ".png";
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc3_:* = null;
         super.show(param1);
         this.bottom = 80;
         this.scaleX = 1;
         this.scaleY = 1;
         var _loc2_:DictHash = StcMgr.ins.getFunctionOpenTipsTable();
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_.array;
         for each(var _loc4_ in _loc2_.array)
         {
            if(_loc4_.tipsOpenLv <= PlayerModel.ins.level)
            {
               if(_loc3_ == null)
               {
                  _loc3_ = _loc4_;
               }
               else if(_loc3_.tipsOpenLv < _loc4_.tipsOpenLv)
               {
                  _loc3_ = _loc4_;
               }
            }
         }
         txtOpenLv.text = LocaleMgr.ins.getStr(999000743,[_loc3_.functionOpenLv.toString()]);
         txtFunName.text = LocaleMgr.ins.getStr(_loc3_.name);
         txtFunDesc.text = LocaleMgr.ins.getStr(_loc3_.describe);
         img_new.url = "modules/funcOpen/" + _loc3_.icon + ".png";
         GlobalRef.bottomModuleBtns.removeShine();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_close === _loc2_)
         {
            userClose = true;
            ModuleMgr.ins.closeModule(96701);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         TweenLite.to(this,0.3,{
            "bottom":60,
            "scaleX":0.1,
            "scaleY":0.1,
            "onComplete":super.preClose,
            "onCompleteParams":[param1]
         });
      }
   }
}
