resource "aws_appautoscaling_target" "flask_app_target" {
  max_capacity       = 5
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.flask_app_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# Auto Scaling Target for Nginx Service
resource "aws_appautoscaling_target" "nginx_target" {
  max_capacity       = 5
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.nginx_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# Auto Scaling Target for Redis Service (optional, usually single instance)
resource "aws_appautoscaling_target" "redis_target" {
  max_capacity       = 3
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.redis_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# Auto Scaling Policy for Flask App Service
# Flask App - CPU Scale Up Policy
resource "aws_appautoscaling_policy" "flask_app_scale_up_cpu" {
  name               = "${var.environment}-${var.app_name}-flask-scale-up-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.flask_app_target.resource_id
  scalable_dimension = aws_appautoscaling_target.flask_app_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.flask_app_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}

# Flask App - Memory Scale Up Policy
resource "aws_appautoscaling_policy" "flask_app_scale_up_memory" {
  name               = "${var.environment}-${var.app_name}-flask-scale-up-memory"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.flask_app_target.resource_id
  scalable_dimension = aws_appautoscaling_target.flask_app_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.flask_app_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}

# Nginx - CPU Scale Up Policy
resource "aws_appautoscaling_policy" "nginx_scale_up_cpu" {
  name               = "${var.environment}-${var.app_name}-nginx-scale-up-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.nginx_target.resource_id
  scalable_dimension = aws_appautoscaling_target.nginx_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.nginx_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}