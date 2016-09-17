package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.YuanFenDetailRenderUI;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import nslm2.common.vo.WealthVo;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.consts.NPCPropConsts;
   
   public class YuanFenDetailRender extends YuanFenDetailRenderUI
   {
       
      
      private var _data:MengYuePropVo;
      
      public function YuanFenDetailRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc12_:* = null;
         var _loc2_:int = 0;
         var _loc13_:* = 0;
         var _loc14_:* = null;
         .super.dataSource = param1;
         _data = param1 as MengYuePropVo;
         if(!_data)
         {
            return;
         }
         txt_name.text = _data.name;
         var _loc15_:Array = _data.stcMengyueVo.condition.split("|");
         var _loc11_:Array = [];
         if(_data.stcMengyueVo.kind == 1)
         {
            _loc15_.unshift(_data.heroBaseInfo.baseId);
         }
         var _loc4_:int = _loc15_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc4_)
         {
            _loc9_ = _loc15_[_loc8_];
            _loc7_ = new WealthVo();
            _loc7_.sid = _loc9_;
            _loc7_.extraData = _data.heroBaseInfo.id;
            if(_data.stcMengyueVo.kind == 1)
            {
               _loc7_.kind = 30;
            }
            else
            {
               _loc7_.kind = 20;
            }
            _loc11_.push(_loc7_);
            _loc8_++;
         }
         list_item.dataSource = _loc11_;
         var _loc16_:Array = _data.stcMengyueVo.attr.split("|");
         var _loc3_:int = _loc16_.length;
         var _loc5_:Array = [];
         var _loc6_:Boolean = false;
         _loc8_ = 0;
         while(_loc8_ < _loc3_)
         {
            _loc10_ = _loc16_[_loc8_];
            _loc12_ = _loc10_.split(":");
            _loc2_ = _loc12_[0];
            _loc13_ = uint(NpcPropVo.getValueColorByPropId(_loc2_));
            if(_data.isActivate)
            {
               _loc14_ = TextFieldUtil.htmlText2(NPCPropConsts.ins.showValue(_loc12_[1],"+"),_loc13_);
            }
            else
            {
               _loc14_ = NPCPropConsts.ins.showValue(_loc12_[1],"+");
            }
            _loc5_.push(NPCPropConsts.ins.getLocaleNameNormal(_loc2_) + " " + _loc14_);
            _loc8_++;
         }
         if(_data.isActivate)
         {
            txt_name.color = 458496;
            txt_des1.color = 458496;
            txt_des2.color = 458496;
         }
         else
         {
            txt_name.color = 7566195;
            txt_des1.color = 7566195;
            txt_des2.color = 7566195;
         }
         txt_des1.text = _loc5_[0];
         if(_loc5_.length > 0)
         {
            txt_des2.text = _loc5_[1];
         }
         else
         {
            txt_des2.text = "";
         }
      }
   }
}
