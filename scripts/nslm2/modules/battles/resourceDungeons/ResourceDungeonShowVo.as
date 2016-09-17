package nslm2.modules.battles.resourceDungeons
{
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeNanduVo;
   import proto.HeroPracticeFightStartRes;
   
   public class ResourceDungeonShowVo
   {
       
      
      public var stcVo:StcHeropracticeNanduVo;
      
      public var res:HeroPracticeFightStartRes;
      
      public function ResourceDungeonShowVo(param1:StcHeropracticeNanduVo, param2:HeroPracticeFightStartRes)
      {
         super();
         this.stcVo = param1;
         this.res = param2;
      }
   }
}
