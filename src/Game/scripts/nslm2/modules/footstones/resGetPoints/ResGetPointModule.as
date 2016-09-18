package nslm2.modules.footstones.resGetPoints
{
   import game.ui.resGetPoints.ResGetPointModuleUI;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.handlers.Handler;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcLessVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import morn.core.utils.StringUtils;
   import nslm2.modules.Chapters.ChapterModel;
   
   public class ResGetPointModule extends ResGetPointModuleUI
   {
       
      
      public function ResGetPointModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         if(EnvConfig.ins.hideForBS)
         {
            ModuleMgr.ins.closeModule(this.moduleId);
            AlertUtil.alert(LocaleMgr.ins.getStr(999000137));
            return;
         }
         if(param1 is ResGetPointModuleParamArr)
         {
            showIndex((param1 as ResGetPointModuleParamArr).title,(param1 as ResGetPointModuleParamArr).arr as Array);
         }
         else if(param1 is Array)
         {
            showIndex(null,param1 as Array);
         }
         else
         {
            _loc2_ = param1 as ResGetPointModuleParam;
            showContent(_loc2_);
         }
         super.preShow();
      }
      
      private function showIndex(param1:String, param2:Array) : void
      {
         if(param1 == null)
         {
            param1 = LocaleMgr.ins.getStr(12101004);
         }
         this.panelBg.txt_titleName.text = param1;
         this.list_items.visible = true;
         this.con_con.visible = false;
         this.list_items.dataSource = param2;
         this.fadeViewId = 11010;
         this.fadeIn(0,11010);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("MSG_RES_GET_POINT_ENTER","msg_item_num_change");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_RES_GET_POINT_ENTER" !== _loc4_)
         {
            if("msg_item_num_change" === _loc4_)
            {
               resRender.wealthVo = resRender.wealthVo;
            }
         }
         else
         {
            _loc3_ = param2 as ResGetPointModuleParam;
            if(_loc3_.clickHandler)
            {
               ModuleMgr.ins.closeModule(this.moduleId);
               Handler.execute(_loc3_.clickHandler);
            }
            else
            {
               showContent(param2);
            }
         }
      }
      
      private function showContent(param1:ResGetPointModuleParam) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc11_:* = null;
         var _loc9_:int = 0;
         var _loc6_:* = null;
         var _loc12_:int = 0;
         var _loc8_:String = LocaleMgr.ins.getStr(12101000);
         this.panelBg.txt_titleName.text = _loc8_;
         this.list_items.visible = false;
         this.con_con.visible = true;
         var _loc5_:int = param1.lessId;
         var _loc10_:StcLessVo = StcMgr.ins.getLessVo(_loc5_);
         if(_loc10_)
         {
            if(param1.wealthKind != 20)
            {
               this.resRender.visible = false;
               this.txt_desc.visible = true;
               if(_loc5_ == DefindConsts.MAINHERO_LV_LESS_ID && param1.needNum != 0)
               {
                  this.txt_desc.text = LocaleMgr.ins.getStr(10000003) + ":" + TextFieldUtil.htmlText2(param1.needNum,16723968) + "\n" + LocaleMgr.ins.getStr(_loc10_.desc_all);
               }
               else
               {
                  this.txt_desc.text = LocaleMgr.ins.getStr(_loc10_.desc_all);
               }
            }
            else
            {
               this.resRender.wealthVo = WealthUtil.needVo(param1.wealthKind,param1.sid,param1.needNum);
               this.resRender.txt_countAndNeed.visible = param1.needNum > 0;
               this.resRender.btn_enter.visible = false;
               this.txt_desc.visible = false;
               this.resRender.bg.visible = false;
            }
            _loc4_ = _loc10_.function_id.split("|");
            _loc3_ = _loc10_.star.split("|");
            _loc7_ = _loc10_.para_id.split("|");
            _loc2_ = _loc10_.name.split("|");
            _loc11_ = _loc10_.desc.split("|");
            _loc9_ = _loc4_.length;
            _loc6_ = [];
            _loc12_ = 0;
            while(_loc12_ < _loc9_)
            {
               if(!(EnvConfig.ins.hideForBS && _loc4_[_loc12_] == 11200))
               {
                  _loc6_.push(new ResGetPointListItem(_loc4_[_loc12_],_loc3_[_loc12_],_loc7_[_loc12_],_loc2_[_loc12_],_loc11_[_loc12_]));
               }
               _loc12_++;
            }
            _loc6_.sort(resSortFunc);
            this.list_points.array = _loc6_;
            if(param1.errMsgLanCode || param1.errMsg)
            {
               if(param1.errMsgLanCode)
               {
                  txt_errorTip.text = LocaleMgr.ins.getStr(param1.errMsgLanCode);
               }
               if(param1.errMsg)
               {
                  txt_errorTip.text = param1.errMsg;
               }
            }
            else
            {
               txt_errorTip.text = "";
            }
            this.fadeViewId = 12101;
            this.fadeIn(0,12101);
         }
         else
         {
            this.txt_desc.visible = true;
            this.txt_desc.text = LocaleMgr.ins.getStr(999000138);
            new StcLackFatal(this,"static_less",_loc5_);
         }
      }
      
      private function resSortFunc(param1:ResGetPointListItem, param2:ResGetPointListItem) : int
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if((param1.funcId == 40408 || param1.funcId == 40400) && (param2.funcId == 40408 || param2.funcId == 40400))
         {
            if(param1.funcId == param2.funcId)
            {
               if(int(param1.paraId) < int(param2.paraId))
               {
                  return -1;
               }
               return 1;
            }
            if(StringUtils.isNull(param1.paraId) == true || StringUtils.isNull(param2.paraId) == true)
            {
               return 0;
            }
            _loc3_ = ChapterModel.ins.canEnterStage(int(param1.paraId),false,false);
            _loc4_ = ChapterModel.ins.canEnterStage(int(param2.paraId),false,false);
            if(_loc3_ == false && _loc4_ == false)
            {
               return 0;
            }
            if(_loc3_ == false)
            {
               return 1;
            }
            if(_loc4_ == false)
            {
               return -1;
            }
            if(param1.funcId == 40408)
            {
               return -1;
            }
            if(param2.funcId == 40408)
            {
               return 1;
            }
            return 0;
         }
         if((param1.funcId == 40408 || param1.funcId == 40400) && (param2.funcId == 11306 || param2.funcId == 60310))
         {
            return 1;
         }
         if((param2.funcId == 40408 || param2.funcId == 40400) && (param1.funcId == 11306 || param1.funcId == 60310))
         {
            return -1;
         }
         return 0;
      }
   }
}
