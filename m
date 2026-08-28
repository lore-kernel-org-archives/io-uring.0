Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C032D73A1
	for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952647; cv=none; b=Ih5W0LLRNQ5EvgQXr9ufQ8SZwv5CY7zUvY6Tdnh8SrP4mlb+H3Yns98/84VJOkLs58bTgZq20nkP99Jb9pS7Lv5fVGsyuUJeGqdZWJaoctUKqjk7n11c+87ipli3afzIz0oxse/lfvzhPWAkhs4FugyOXXqA7c8672os4gCS3SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952647; c=relaxed/simple;
	bh=JtiSeIBr6XCy6Up8INh7USJqLVf8tePA4u7uufNEmwM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=hdF77o8V/5kGpnzXf7HeaturDvztGad7d8Txzp0M0rx22muGmJ7QDgla29BUIXYOQeKPfqm/POGzcT0JPkSDlFTleXA9wqd0/Ogf28JOq/FQXEbsKJnYWrqPabitV5WC9cUCdnEkU1mxACFXqMbaUgxx5B1p4FRBuh2hL6Ub/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=kKXsnc8Z; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="kKXsnc8Z"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7ee37dc91f5so872736a34.3
        for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1787952643; x=1788557443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e+U9fGL4gwIJZxISY6aHJpzpOrz7JsV+Tu414ase5+4=;
        b=kKXsnc8ZvkTfn8cHcroYgXPNIIfUH6gBDUYTZwk5cODw9i/lLZs1s6Hs1vtfiESoky
         R3hnn4Mj98C8E20auzUO8S3RCIzop+wtvqkh3pUei/WIyW4j/gJSy+axMpE1gS1iy9T8
         DwTbAebj0W+aRbjuAcm7zTkot9p09OnqeU7iJviLE+5eQgoB+9TFdt1UoWpP/iPwbwL8
         k7OW8Y1hy6UpMvB1lNxz5k34G93YCmYIOsrtul5lf2nkC3aPc39z49OSG7xv51pgfuO3
         I7UeH0R7xrrIwp4T26CRIflAV0FGkTEATuSj4LMc+m0xHdB2qO50U/pYw9v2nediLE+2
         zIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787952643; x=1788557443;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+U9fGL4gwIJZxISY6aHJpzpOrz7JsV+Tu414ase5+4=;
        b=QDmcXJ5oifEu4+vdCNmnVCy7YdN1bRVukHUbMlLNciMYHWd9AX0e+oGrRxnX8OLnqN
         C185lWQzJcVBQTvpfEShrzpkjhvqTqwh+TAqJ9UJK2XSH3uojO/ql53TF1hRHrlrklyP
         bRKrBUwZ1VtjO9dSwavROspJ6nToydPwumrnRYru9ZSJ4Pq2vCnO3BlDyGc4EwQMTJ5I
         Tr4wjKgcBLCQvmgcU508NnNDbUh3wqN+6xeEJ77G8uLz7hfZsAMi2I+dyGkfcz4lajU0
         fKJhKleZzkXrSGax6HYMJDpvRfZ6dEHDNWF/zzPVWqL05L/XqFIVarR/ToIaP4JHv8wp
         x2Ug==
X-Gm-Message-State: AFuF++mKm9Ai5MN57Y4Fb+qeBcB3Zdc7lxU+dX/qN5dqnjYSpWHHwRt8
	mvZ3a53fcZwuqJ1vTKJtN3tyihHdzXWncRjBEPui60JzNaZFT9N+P8NNL2ieJsovpzfm8z2YacP
	pezgRLyM=
X-Gm-Gg: AR+sD130NjbiP5y4Ioob3Tql98gdd0D3np8SU/E/lkV1XMf3hJp8M5MSuP25LmgyLaE
	L/cHyuJykdEvKkpY6W6VVu3FvIvO0/5YLiNWUoyE3j6GRH6Ne/K2VgkZNFOfkSIYCOYKIJF9H3l
	Uw+UlPz4SrJvA/r+Fgmb6wSbJ/WBfJQblVtypwBg+f3FpkcS/nz2Wh0P4SsQXDWkrKgOqQiBiTS
	uzB87H+JTNAvSwV0r4c/FxBztooZ9xqjsKiiP6N1/e7ZAdcdVOBjVwqh40SbyBkZZNJ6liBk5dV
	byafgonAYUnfUP0TG4FUfZvpLxcW2FkzExDKJzjo2+IYk1jLXJ0ZYNrSM34PYUOd9OOi0t/EVir
	XgZcxqmAPxer26S3aDC+wneKfMA7In9KIq6dADpcO2BY9w1sEOO759AnahZbdb1IT+reatBkzAI
	CZeAaIOw2K03NC2EGUZoVXjL7e9uHv92H92iORvnzoYUbp0ok14fmTpQG3oNPG41QH3MlSjVPKf
	3ZqF8lTBXjRybTvNUTPh//oWilrcZNkgg5olZgDe4OOlUo=
X-Received: by 2002:a05:6830:680f:b0:7f4:c88c:7b10 with SMTP id 46e09a7af769-7f4f24de4efmr11641445a34.12.1787952643609;
        Fri, 28 Aug 2026 14:30:43 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa6bc059sm2219781a34.3.2026.08.28.14.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 14:30:43 -0700 (PDT)
Message-ID: <97f27939-a322-42be-906d-d9ef485f0ecd@kernel.dk>
Date: Fri, 28 Aug 2026 15:30:42 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fixes for 7.3-rc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

A few smaller fixes for io_uring that should go into the 7.3-rc1 kernel,
all three headed to stable as well. This pull request contains:

- A few fixes around cancelation and teardown for waitid

- Cap the user size for the query interface copy-out.

Please pull!


The following changes since commit 66498c75b4f8017f62d720d9b59675bdf3abce91:

  Merge tag 'dmaengine-7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine (2026-08-24 12:21:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20260828

for you to fetch changes up to 2cf20c4e0f72d523b8673053e7120d092ff1f074:

  io_uring/waitid: avoid siginfo copy during ring teardown (2026-08-25 11:51:38 -0600)

----------------------------------------------------------------
io_uring-7.3-20260828

----------------------------------------------------------------
Hui Su (2):
      io_uring/waitid: honor task_work cancellation
      io_uring/waitid: avoid siginfo copy during ring teardown

Laxman Acharya Padhya (1):
      io_uring/query: cap user size passed to copy_struct_to_user

 io_uring/query.c  |  3 +++
 io_uring/waitid.c | 33 ++++++++++++++++++++++++++-------
 2 files changed, 29 insertions(+), 7 deletions(-)

-- 
Jens Axboe

