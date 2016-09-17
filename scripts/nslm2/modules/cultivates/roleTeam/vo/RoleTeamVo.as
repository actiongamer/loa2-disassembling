package nslm2.modules.cultivates.roleTeam.vo
{
   import proto.PanelBaseInfo;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   
   public class RoleTeamVo
   {
       
      
      private var _index:int;
      
      private var _openLvl:int;
      
      public var heroData:PanelBaseInfo;
      
      public function RoleTeamVo()
      {
         super();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function set index(param1:int) : void
      {
         if(_index != param1)
         {
            _index = param1;
         }
      }
      
      public function get openLvl() : int
      {
         return RoleTeamModel.ins.posOpenLvl[index];
      }
   }
}
