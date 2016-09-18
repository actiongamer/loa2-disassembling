package nslm2.modules.cultivates.roleTeam.vo
{
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.common.model.PlayerModel;
   
   public class YuanJunVo extends RoleTeamVo
   {
       
      
      public function YuanJunVo()
      {
         super();
      }
      
      override public function get openLvl() : int
      {
         return RoleTeamModel.ins.yuanJunOpenLvl[index];
      }
      
      public function get isOpen() : Boolean
      {
         return PlayerModel.ins.level >= openLvl;
      }
   }
}
