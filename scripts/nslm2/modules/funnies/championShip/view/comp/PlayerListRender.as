package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.PlayerListRenderUI;
   import proto.CompetePlayerDisplayInfo;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.model.PlayerModel;
   
   public class PlayerListRender extends PlayerListRenderUI
   {
       
      
      private var _data:CompetePlayerDisplayInfo;
      
      public function PlayerListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as CompetePlayerDisplayInfo;
         img_bgSelf.visible = false;
         txt_name.text = "";
         if(_data)
         {
            txt_name.text = LinkUtils.playerNameSmart(_data.baseInfo.id,_data.baseInfo.name,_data.baseInfo.dist,ColorLib.getMilitaryColor(_data.baseInfo.militaryRank));
            if(PlayerModel.ins.isCurPlayer(_data.baseInfo.id))
            {
               img_bgSelf.visible = true;
            }
         }
         .super.dataSource = param1;
      }
   }
}
