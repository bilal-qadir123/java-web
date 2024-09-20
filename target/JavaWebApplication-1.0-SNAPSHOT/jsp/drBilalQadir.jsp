










<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Bilal Qadir</title>
    <link rel="stylesheet" href="css/doctor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">



</head>

<body>
<div class="container light-style flex-grow-1 container-p-y">

    <div class="card overflow-hidden">
        <div class="row no-gutters row-bordered row-border-light">
            <div class="col-md-3 pt-0">
                <div class="list-group list-group-flush account-settings-links">
                    <a class="list-group-item list-group-item-action active" data-toggle="list"
                       href="#account-general">General</a>

                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#account-info">Info</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#account-social-links">Social links</a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="account-general">
                        <div class="card-body media align-items-center">
                            <img src="Images/picture.png" alt class="d-block ui-w-80">
                            <label class="btn btn-default md-btn-flat">
                                Doctor Bilal Qadir
                            </label>
                            <label class="senior-btn">
                                (Senior Doctor)
                            </label>
                            <img src="Images/stethoscope.png" alt="Stethoscope" class="stethoscope-icon">
                        </div>

                        <hr class="border-light m-0">
                        <div class="card-body">
                            <div class="form-group">
                                <label class="form-label">Doctor Id</label>
                                <input type="text" class="form-control mb-1" value="24" disabled></label>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Doctor Name</label>
                                <input type="text" class="form-control" value="Muhammad Bilal Qadir" disabled>
                            </div>
                            <div class="form-group">
                                <label class="form-label">E-mail Address</label>
                                <input type="text" class="form-control mb-1" value="bilalq@ihc.health.pk" disabled>
                                <div class="alert alert-warning mt-3">
                                    Want more than just email?<br>
                                    Click
                                    <a href="javascript:void(0)" id="social-links-link">here</a>
                                    for other social links.
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Company</label>
                                <input type="text" class="form-control" value="Inaam HealthCare Ltd." disabled>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" >
                        <div class="card-body pb-2">

                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-info">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <label class="form-label">Bio</label>
                                <textarea class="form-control" readonly
                                          rows="5">Dr. Bilal Qadir is a seasoned medical professional with over 22 years of experience in the healthcare industry. His career began with a solid foundation in medicine at the esteemed University of Medicine and Health Sciences, where he excelled in his studies and developed a deep passion for orthopedic surgery. Throughout his career, Dr. Rafay has held various influential roles in both clinical practice and medical administration, shaping him into a versatile and well-rounded expert in his field. Known for his compassionate patient care and innovative treatment approaches, he has earned the respect of colleagues and patients alike. Outside of his medical practice, Dr. Rafay enjoys exploring photography and is an avid advocate for environmental conservation. His dedication to advancing healthcare and improving patient outcomes underscores his commitment to excellence in medicine.</textarea>

                            </div>
                            <div class="form-group">
                                <label class="form-label">Birthday</label>
                                <input type="text" class="form-control" value="August 17, 1987" disabled>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Country</label>

                                <input type="text" class="form-control" value = "Pakistan" disabled></input>
                                </select>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Contacts</h6>
                            <div class="form-group">
                                <label class="form-label">Phone</label>
                                <input type="text" class="form-control" value="+92 342-897352" disabled>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Website</label>
                                <input type="text" class="form-control" value="www.InaamHealthCare.health.pk" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-social-links">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <label class="form-label">Twitter</label>
                                <input type="text" class="form-control" value="https://twitter.com/bilalq" disabled>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Facebook</label>
                                <input type="text" class="form-control" value="https://www.facebook.com/bilalq" disabled>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Google+</label>
                                <input type="text" class="form-control" value="https://plus.google.com/bilalq" disabled>
                            </div>
                            <div class="form-group">
                                <label class="form-label">LinkedIn</label>
                                <input type="text" class="form-control" value="https://www.linkedin.com/in/bilalq" disabled>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Instagram</label>
                                <input type="text" class="form-control" value="https://www.instagram.com/bilalq" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-connections">
                        <div class="card-body">
                            <button type="button" class="btn btn-twitter">Connect to
                                <strong>Twitter</strong></button>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <h5 class="mb-2">
                                <a href="javascript:void(0)" class="float-right text-muted text-tiny"><i
                                        class="ion ion-md-close"></i> Remove</a>
                                <i class="ion ion-logo-google text-google"></i>
                                You are connected to Google:
                            </h5>
                            <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                               data-cfemail="f9979498818e9c9595b994989095d79a9694">[email&#160;protected]</a>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <button type="button" class="btn btn-facebook">Connect to
                                <strong>Facebook</strong></button>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <button type="button" class="btn btn-instagram">Connect to
                                <strong>Instagram</strong></button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-notifications">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Activity</h6>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked>
                                    <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                    <span class="switcher-label">Email me when someone comments on my article</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked>
                                    <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                    <span class="switcher-label">Email me when someone answers on my forum
                                            thread</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input">
                                    <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                    <span class="switcher-label">Email me when someone follows me</span>
                                </label>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Application</h6>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked>
                                    <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                    <span class="switcher-label">News and announcements</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input">
                                    <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                    <span class="switcher-label">Weekly product updates</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="switcher">
                                    <input type="checkbox" class="switcher-input" checked>
                                    <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                    <span class="switcher-label">Weekly blog digest</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

    document.addEventListener("DOMContentLoaded", function() {
        var socialLinksLink = document.getElementById('social-links-link');

        socialLinksLink.addEventListener('click', function(event) {
            event.preventDefault();

            var socialLinksTab = document.querySelector('a[href="#account-social-links"]');
            socialLinksTab.click();
        });
    });

</script>
</body>

</html>