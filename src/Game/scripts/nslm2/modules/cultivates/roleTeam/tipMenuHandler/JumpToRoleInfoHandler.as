package nslm2.modules.cultivates.roleTeam.tipMenuHandler
{
   import nslm2.modules.footstones.tipMenus.handlers.TipMenuHandlerBase;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class JumpToRoleInfoHandler extends TipMenuHandlerBase
   {
       
      
      private var requstList:Array;
      
      private var curIndex:int;
      
      public function JumpToRoleInfoHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         jumpToRoleInfo();
      }
      
      private function jumpToRoleInfo() : void
      {
         requstList = [];
         var _loc3_:int = 0;
         var _loc2_:* = HeroModel.ins.YuanJunArr;
         for each(var _loc1_ in HeroModel.ins.YuanJunArr)
         {
            if(_loc1_.heroData)
            {
               if(!HeroModel.ins.getHeroInfoQuick(_loc1_.heroData.id))
               {
                  requstList.push(_loc1_.heroData.id);
               }
            }
         }
         if(requstList.length > 0)
         {
            curIndex = 0;
            HeroModel.ins.getHeroInfo(requstList[curIndex],curIndex == requstList.length?openModuleHandler:nextInfoHandler);
         }
         else
         {
            openModuleHandler(HeroModel.ins.getHeroInfoQuick((data as YuanJunVo).heroData.id));
         }
      }
      
      private function nextInfoHandler(param1:HeroInfo) : void
      {
         curIndex = Number(curIndex) + 1;
         HeroModel.ins.getHeroInfo(requstList[curIndex],curIndex + 1 == requstList.length?openModuleHandler:nextInfoHandler);
      }
      
      private function openModuleHandler(param1:HeroInfo = null) : void
      {
         var _loc2_:RoleInfoModuleParam = new RoleInfoModuleParam();
         _loc2_.init(HeroModel.ins.getHeroInfoQuick((data as YuanJunVo).heroData.id),20010,false,true);
         ModuleMgr.ins.showModule(30100,_loc2_,30815);
      }
   }
}
