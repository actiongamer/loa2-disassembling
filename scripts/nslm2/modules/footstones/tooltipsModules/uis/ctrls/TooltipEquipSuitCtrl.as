package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipSuitVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   
   public class TooltipEquipSuitCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipEquipSuitCtrl(param1:TooltipUICommon, param2:StcItemVo, param3:Item = null)
      {
         var _loc6_:* = null;
         var _loc13_:* = null;
         var _loc8_:int = 0;
         var _loc10_:* = null;
         var _loc12_:Boolean = false;
         super(param1);
         if(param3)
         {
            _loc6_ = StcMgr.ins.getEquipSuitVo(int(StcMgr.ins.getItemVo(param3.itemId).extend_1));
            _loc13_ = param3.suit;
         }
         else
         {
            _loc6_ = StcMgr.ins.getEquipSuitVo(int(param2.extend_1));
         }
         var _loc4_:Array = StcMgr.ins.getVoArrByColumnValue("static_item","extend_1",_loc6_.id);
         var _loc5_:Array = [];
         _loc4_.sortOn("kind",16);
         var _loc9_:Array = ArrayUtil.removeRepeat(_loc4_,compareFunc);
         var _loc7_:int = _loc9_.length;
         var _loc11_:int = 0;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc10_ = _loc9_[_loc8_];
            _loc12_ = param3 && _loc13_.indexOf(_loc10_.kind) != -1;
            if(_loc12_)
            {
               _loc11_++;
            }
            _loc5_.push(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc10_.name),new TextFormat(null,null,!!_loc12_?16542720:7566195)));
            _loc8_++;
         }
         _loc5_.push(getDesStr(LocaleMgr.ins.getStr(10000005),LocaleMgr.ins.getStr(_loc6_.des_second),_loc11_ >= 2));
         _loc5_.push(getDesStr(LocaleMgr.ins.getStr(10000006),LocaleMgr.ins.getStr(_loc6_.des_three),_loc11_ >= 3));
         _loc5_.push(getDesStr(LocaleMgr.ins.getStr(10000007),LocaleMgr.ins.getStr(_loc6_.des_four),_loc11_ >= 4));
         ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(_loc6_.name),16046112,_loc5_,TooltipTxt,0));
      }
      
      private function getDesStr(param1:String, param2:String, param3:Boolean) : String
      {
         if(param3)
         {
            param2 = NpcPropVo.changePrecentTxtToOrange(param2);
            return TextFieldUtil.htmlText2(param1 + ": " + param2,458496);
         }
         return TextFieldUtil.htmlText2(param1 + ": " + param2,7566195);
      }
      
      private function compareFunc(param1:Array, param2:StcItemVo, param3:int, param4:StcItemVo) : Boolean
      {
         return param2.kind == param4.kind;
      }
   }
}
