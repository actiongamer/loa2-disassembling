package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.TooltipTianfuVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS3;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   
   public class TooltipTianfuCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipTianfuCtrl(param1:TooltipUICommon, param2:TooltipTianfuVo)
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = false;
         super(param1);
         var _loc5_:Array = [];
         _loc7_ = 0;
         while(_loc7_ <= param2.totleTupoLevel)
         {
            _loc6_ = param2.tupoArr[_loc7_];
            if(_loc6_.tupo_level != 0)
            {
               _loc3_ = param2.nowTupoLevel >= _loc6_.tupo_level;
               _loc5_.push(TextFieldUtil.htmlText(getDesStr(_loc6_,_loc3_),new TextFormat(null,null,!!_loc3_?458496:7566195)));
            }
            _loc7_++;
         }
         var _loc4_:TooltipTitleListPanelS3 = new TooltipTitleListPanelS3(LocaleMgr.ins.getStr(30100998),16769442,_loc5_,TooltipTxt);
         ui.box.addChild(_loc4_);
         if(App.languageAry.indexOf(App.language) != -1 && App.languageAry.indexOf(App.language) != 1)
         {
            _loc4_.loopItemRender(-5);
         }
      }
      
      private function getDesStr(param1:StcTupoVo, param2:Boolean) : String
      {
         var _loc3_:String = "";
         _loc3_ = _loc3_ + ("[" + LocaleMgr.ins.getStr(param1.name) + param1.tupo_level + "] " + HeroInfoUtil.getTupoDesc(param1.attr,param2) + " " + LocaleMgr.ins.getStr(30100012,[param1.tupo_level]));
         return _loc3_;
      }
   }
}
