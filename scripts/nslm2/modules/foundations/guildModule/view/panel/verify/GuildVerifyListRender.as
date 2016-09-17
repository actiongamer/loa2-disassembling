package nslm2.modules.foundations.guildModule.view.panel.verify
{
   import game.ui.guildModules.verify.GuildVerifyListRenderUI;
   import proto.FamilyMember;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.utils.Uint64Util;
   
   public class GuildVerifyListRender extends GuildVerifyListRenderUI
   {
       
      
      private var _data:FamilyMember;
      
      public function GuildVerifyListRender()
      {
         super();
      }
      
      override protected function initialize() : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_accept !== _loc2_)
         {
            if(btn_deny === _loc2_)
            {
               GuildServiceHandler.ins.familyApplyOp(2,_data.id);
            }
         }
         else
         {
            GuildServiceHandler.ins.familyApplyOp(1,_data.id);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as FamilyMember;
         if(_data)
         {
            txt_name.text = LinkUtils.playerName(_data.id,_data.name,0);
            txt_power.text = Uint64Util.toString(_data.ability);
            txt_lvl.text = _data.level + "";
         }
      }
      
      override public function dispose() : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,null);
         super.dispose();
      }
   }
}
