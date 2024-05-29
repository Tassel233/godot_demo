class_name BulletRateStrategy
extends BaseSpellStrategy

func change_spell(bulletcontroller: BulletController):
	bulletcontroller.fire_rate += 3
